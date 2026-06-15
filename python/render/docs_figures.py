from __future__ import annotations

from pathlib import Path

import matplotlib

matplotlib.use("Agg")

import matplotlib.font_manager as fm
import matplotlib.pyplot as plt
import numpy as np

from ..paths import FIGURES_DIR
from .utils import add_axis_arrows, style_axes

_FONTS_DIR = Path(__file__).resolve().parent.parent.parent / "docs" / "fonts"
for _f in _FONTS_DIR.glob("*.ttf"):
    fm.fontManager.addfont(str(_f))
for _f in _FONTS_DIR.glob("*.otf"):
    fm.fontManager.addfont(str(_f))
_LABEL_FONT = fm.FontProperties(
    fname=str(Path(__file__).resolve().parent.parent / "fonts" / "TaiwanPearl-Light.ttf")
)

RCPARAMS: dict[str, object] = {
    "font.family": ["TeX Gyre Pagella", "Times New Roman"],
    "font.size": 10,
    "axes.labelsize": 10,
    "legend.fontsize": 8,
    "xtick.labelsize": 9,
    "ytick.labelsize": 9,
    "mathtext.fontset": "custom",
    "mathtext.rm": "TeX Gyre Pagella",
    "mathtext.it": "TeX Gyre Pagella:italic",
    "mathtext.bf": "TeX Gyre Pagella:bold",
    "mathtext.cal": "TeX Gyre Pagella:italic",
    "mathtext.sf": "TeX Gyre Pagella",
    "mathtext.tt": "TeX Gyre Pagella",
}


def apply() -> None:
    plt.rcParams.update(RCPARAMS)


# Normalized: v_L = 1, v_H = 2 (ratio 2:1; results are invariant to rescaling)
V_H: float = 2.0
V_L: float = 1.0


# ── Model functions ───────────────────────────────────────────────────────────


def _vtu(mu: float | np.ndarray, rho: float | np.ndarray, v_h: float, v_l: float, q: float) -> float | np.ndarray:
    return v_l + (q + rho * (mu - q)) * (v_h - v_l)


def _a(rho: float, v_h: float, v_l: float, q: float) -> float:
    return q * _vtu(1, rho, v_h, v_l, q) / np.sqrt(v_h) + (1 - q) * _vtu(0, rho, v_h, v_l, q) / np.sqrt(v_l)


def _b(rho: float, v_h: float, v_l: float, q: float) -> float:
    return q * _vtu(1, rho, v_h, v_l, q) / v_h + (1 - q) * _vtu(0, rho, v_h, v_l, q) / v_l


def _pi_ss(rho: float, v_h: float, v_l: float, q: float) -> float:
    c = _a(rho, v_h, v_l, q) / (1 + _b(rho, v_h, v_l, q))
    return q * (np.sqrt(v_h) - c) ** 2 + (1 - q) * (np.sqrt(v_l) - c) ** 2


def _pi_iu_sep(rho: float, v_h: float, v_l: float, q: float) -> float:
    return q * v_h ** 2 / (4 * _vtu(1, rho, v_h, v_l, q)) + (1 - q) * v_l ** 2 / (4 * _vtu(0, rho, v_h, v_l, q))


def _rho_star(v_h: float, v_l: float, q: float) -> float:
    R = v_h ** 2 / (v_l * (2 * v_h - v_l))
    dv = v_h - v_l
    vtq = v_l + q * dv
    return (R - 1) * vtq / ((1 - q + R * q) * dv)


def _bisect(f, a: float, b: float, tol: float = 1e-10) -> float | None:
    fa, fb = f(a), f(b)
    if fa * fb >= 0:
        return None
    for _ in range(100):
        m = (a + b) / 2
        fm = f(m)
        if abs(fm) < tol or b - a < tol:
            return m
        if fa * fm < 0:
            b, fb = m, fm
        else:
            a, fa = m, fm
    return (a + b) / 2


def _rho_dagger(v_h: float, v_l: float, q: float) -> float | None:
    rs = _rho_star(v_h, v_l, q)
    if rs <= 1e-9:
        return None
    return _bisect(
        lambda r: _pi_iu_sep(r, v_h, v_l, q) - _pi_ss(r, v_h, v_l, q),
        1e-9, rs - 1e-9,
    )


def _t_iu(rho: float, v_h: float, v_l: float, q: float, rstar: float) -> float:
    if rho <= rstar:
        return (q * v_h + (1 - q) * v_l) / 2
    vt1 = _vtu(1, rho, v_h, v_l, q)
    vt0 = _vtu(0, rho, v_h, v_l, q)
    alpha = 1 - vt0 / vt1
    return (v_h / 2) * (1 - (1 - q) * np.sqrt(alpha))


def _t_ui(rho: float, v_h: float, v_l: float, q: float) -> float:
    e_sv = q * np.sqrt(v_h) + (1 - q) * np.sqrt(v_l)
    return (_a(rho, v_h, v_l, q) / 2) * e_sv


def _t_ss(rho: float, v_h: float, v_l: float, q: float) -> float:
    e_sv = q * np.sqrt(v_h) + (1 - q) * np.sqrt(v_l)
    return (_a(rho, v_h, v_l, q) / (1 + _b(rho, v_h, v_l, q))) * e_sv


# ── Figure 1: 2D timing region in (q, ρ) ─────────────────────────────────────


def render_timing_region(v_h: float = V_H, v_l: float = V_L) -> None:
    """2D equilibrium timing regions. Sweep q ∈ (0,1); ρ*(q) closed-form, ρ†(q) by bisection."""
    q_vals = np.linspace(0.0, 1.0, 1001)
    rstar = np.array([_rho_star(v_h, v_l, q) for q in q_vals])
    rdag_raw = [_rho_dagger(v_h, v_l, q) for q in q_vals]
    rdag = np.array([r if r is not None else np.nan for r in rdag_raw])
    delta_iu_ss_at_zero = np.array([
        _pi_iu_sep(1e-9, v_h, v_l, q) - _pi_ss(1e-9, v_h, v_l, q)
        for q in q_vals
    ])
    iu_upper = np.where(np.isnan(rdag), np.where(delta_iu_ss_at_zero >= 0.0, rstar, 0.0), rdag)

    fig, ax = plt.subplots(figsize=(3.8, 3.2))

    # Shaded regions (light → dark: sep fails, SS, IU)
    ax.fill_between(q_vals, rstar, 1.0, color="0.82", lw=0)
    ax.fill_between(q_vals, 0.0, rstar, color="0.60", lw=0)
    ax.fill_between(q_vals, 0.0, iu_upper, color="0.38", lw=0)

    # Boundary curves
    ax.plot(q_vals, rstar, "k-", lw=1.1, label=r"$\rho^*$")
    mask = ~np.isnan(rdag)
    ax.plot(q_vals[mask], rdag[mask], "k--", lw=1.1, label=r"$\rho^\dagger$")

    # Region labels at fixed q positions.
    q_ref = 0.5
    iu_label_x = 0.25
    rs_ref = _rho_star(v_h, v_l, q_ref)
    rd_ref = _rho_dagger(v_h, v_l, q_ref)

    ax.text(q_ref, (rs_ref + 1.0) / 2, "未扭曲分離失效",
            ha="center", va="center", fontsize=7.5, color="0.15",
            fontproperties=_LABEL_FONT)
    ax.text(q_ref, (rs_ref + (rd_ref or 0)) / 2, r"知情者偏好 $\mathrm{SS}$",
            ha="center", va="center", fontsize=7.5, color="0.05",
            fontproperties=_LABEL_FONT)
    if rd_ref is not None:
        ax.text(iu_label_x, rd_ref / 2 + 0.03, r"知情者偏好 $\mathrm{IU}$",
                ha="center", va="center", fontsize=7.5, color="white",
                fontproperties=_LABEL_FONT)

    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    ax.set_xticks([1.0])
    ax.set_xticklabels([r"$1$"])
    ax.set_yticks([1.0])
    ax.set_yticklabels([r"$1$"])
    ax.text(0, 0, r"$0$", ha="right", va="top", fontsize=9, clip_on=False)
    ax.set_xlabel(r"$q$")
    ax.set_ylabel(r"$\rho$", rotation=0, labelpad=8)
    ax.margins(x=0.0, y=0.0)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["bottom"].set_linewidth(0.45)
    ax.spines["left"].set_linewidth(0.45)
    ax.spines["bottom"].set_bounds(0, 1)
    ax.spines["left"].set_bounds(0, 1)
    ax.legend(frameon=True, facecolor="white", edgecolor="black", fancybox=False,
              fontsize=8, loc="upper right")
    fig.tight_layout(pad=0.4)
    fig.savefig(FIGURES_DIR / "fig_timing_region.pdf", bbox_inches="tight")
    plt.close(fig)


# ── Figure 2: dissipation comparison ─────────────────────────────────────────


def render_dissipation(v_h: float = V_H, v_l: float = V_L, q: float = 0.5) -> None:
    """T̃^IU, T̃^UI, T̃^SS vs ρ. Normalized v_L=1, v_H=2; q=1/2 (symmetric prior)."""
    rs = _rho_star(v_h, v_l, q)
    rho = np.linspace(0.0, 1.0, 500)

    t_iu = np.array([_t_iu(r, v_h, v_l, q, rs) for r in rho])
    t_ui = np.array([_t_ui(r, v_h, v_l, q) for r in rho])
    t_ss = np.array([_t_ss(r, v_h, v_l, q) for r in rho])

    fig, ax = plt.subplots(figsize=(3.8, 2.9))
    y_min = min(t_iu.min(), t_ui.min(), t_ss.min())
    y_max = max(t_iu.max(), t_ui.max(), t_ss.max())
    y_pad = 0.04 * (y_max - y_min)
    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(y_min - y_pad, y_max + y_pad)
    ax.set_xticks([rs, 1.0])
    ax.set_xticklabels([r"$\rho^*$", r"$1$"])
    style_axes(ax, r"$\rho$", r"$\widetilde{T}$")
    ax.margins(x=0.0, y=0.0)
    add_axis_arrows(ax)
    ax.plot(rho, t_iu, "k-", lw=1.15, label=r"$\widetilde{T}^{IU}$",
            zorder=3, clip_on=False, solid_capstyle="projecting")
    ax.plot(rho, t_ui, "k--", lw=1.15, label=r"$\widetilde{T}^{UI}$",
            zorder=3, clip_on=False, dash_capstyle="projecting")
    ax.plot(rho, t_ss, "k", lw=1.15, ls=(0, (5, 2.5)), label=r"$\widetilde{T}^{SS}$",
            zorder=3, clip_on=False, dash_capstyle="projecting")
    ax.axvline(rs, color="k", lw=0.55, ls=":", zorder=2)
    ax.legend(frameon=True, facecolor="white", edgecolor="black", fancybox=False,
              fontsize=8, loc="upper right")
    ax.text(0, ax.get_ylim()[0], r"$0$", ha="right", va="top", fontsize=9, clip_on=False)
    fig.tight_layout(pad=0.4)
    fig.savefig(FIGURES_DIR / "fig_dissipation.pdf", bbox_inches="tight")
    plt.close(fig)




def main() -> None:
    apply()
    render_timing_region()
    render_dissipation()


if __name__ == "__main__":
    main()
