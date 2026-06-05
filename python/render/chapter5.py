from __future__ import annotations

import math

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import ListedColormap
from matplotlib.patches import Patch
from matplotlib.ticker import FuncFormatter

from ..paths import FIGURES_DIR
from ..style import apply as apply_style
from .utils import style_axes, add_axis_arrows

V = 1.0


def support_from_mu_delta(mu: float, delta: float, q: float) -> tuple[float, float]:
    V_L = mu - 2.0 * q * delta
    v_h = mu + 2.0 * (1.0 - q) * delta
    return V_L, v_h


def sigma2_binary(V_L: float, v_h: float, q: float) -> float:
    return q * (1.0 - q) * (v_h - V_L) ** 2


def binary_kappa(V_L: float, v_h: float, q: float = 0.5) -> float:
    return (1.0 - q) / math.sqrt(V_L) + q / math.sqrt(v_h)


def binary_nu(V_L: float, v_h: float, q: float = 0.5) -> float:
    return (1.0 - q) * math.sqrt(V_L) + q * math.sqrt(v_h)


def binary_lambda(V_L: float, v_h: float, q: float = 0.5) -> float:
    return (1.0 - q) / V_L + q / v_h


def e_i_ss(V_L: float, v_h: float, q: float, v: float) -> float:
    kappa = binary_kappa(V_L, v_h, q)
    lam = binary_lambda(V_L, v_h, q)
    c = V * kappa / (1.0 + V * lam)
    return (math.sqrt(v) - c) ** 2


def e_i_ss_ex_ante(mu: float, V_L: float, v_h: float, q: float) -> float:
    kappa = binary_kappa(V_L, v_h, q)
    nu = binary_nu(V_L, v_h, q)
    lam = binary_lambda(V_L, v_h, q)
    denom = 1.0 + V * lam
    return mu - 2.0 * V * kappa * nu / denom + (V * kappa) ** 2 / denom**2


def e_u_ui(V_L: float, v_h: float, q: float) -> float:
    kappa = binary_kappa(V_L, v_h, q)
    return (V * kappa) ** 2 / 4.0


def e_u_iu(mu: float, V_L: float, v_h: float, q: float) -> float:
    return ((2.0 * V - mu) ** 2 + sigma2_binary(V_L, v_h, q)) / (4.0 * V)


def e_i_iu(v: np.ndarray) -> np.ndarray:
    return v**2 / (4.0 * V)


def _int_tick(x: float, _: object) -> str:
    if abs(x - round(x)) < 1e-8:
        return str(int(round(x)))
    return ""


def _half_tick(x: float, _: object) -> str:
    if abs(x - round(x)) < 1e-8:
        return str(int(round(x)))
    if abs((x * 2) - round(x * 2)) < 1e-8:
        return f"{x:.1f}"
    return ""


def uniform_kappa(mu: float, delta: float) -> float:
    a, b = mu - delta, mu + delta
    return (math.sqrt(b) - math.sqrt(a)) / delta


def uniform_lambda(mu: float, delta: float) -> float:
    a, b = mu - delta, mu + delta
    return math.log(b / a) / (2.0 * delta)


def uniform_r(v: np.ndarray, mu: float, delta: float, prize_v: float) -> np.ndarray:
    kappa = uniform_kappa(mu, delta)
    lam = uniform_lambda(mu, delta)
    c = prize_v * kappa / (1.0 + prize_v * lam)
    return (np.sqrt(v) - c) ** 2 - (v**2) / (4.0 * prize_v)


def render_timing_regions(q_values: tuple[float, ...] = (0.3, 0.5, 0.7)) -> None:
    mu_vals = np.linspace(0.2, 2.0, 241)
    delta_vals = np.linspace(0.0, 1.2, 221)
    cmap = ListedColormap(["#f2f2f2", "#d9d9d9", "#bdbdbd", "#969696"])

    n = len(q_values)
    panel_size, legend_w = 3.6, 1.7
    margin_l, margin_r, margin_b, margin_t, gap = 0.55, 0.15, 0.65, 0.45, 0.45
    fig_w = margin_l + n * panel_size + (n - 1) * gap + legend_w + margin_r
    fig_h = margin_b + panel_size + margin_t
    fig = plt.figure(figsize=(fig_w, fig_h))
    axes = []
    for k in range(n):
        left = (margin_l + k * (panel_size + gap)) / fig_w
        ax = fig.add_axes((left, margin_b / fig_h, panel_size / fig_w, panel_size / fig_h))
        axes.append(ax)

    for ax, q in zip(axes, q_values):
        grid = np.full((len(delta_vals), len(mu_vals)), np.nan)
        for i, delta in enumerate(delta_vals):
            for j, mu in enumerate(mu_vals):
                V_L, v_h = support_from_mu_delta(mu, delta, q)
                if V_L <= 0 or v_h <= V_L:
                    continue
                delta_i_iu = (mu * mu + sigma2_binary(V_L, v_h, q)) / (4.0 * V) - e_i_ss_ex_ante(mu, V_L, v_h, q)
                delta_u = e_u_ui(V_L, v_h, q) - e_u_iu(mu, V_L, v_h, q)
                if delta_i_iu >= 0 and delta_u >= 0:
                    grid[i, j] = 0
                elif delta_i_iu >= 0 and delta_u < 0:
                    grid[i, j] = 1
                elif delta_i_iu < 0 and delta_u >= 0:
                    grid[i, j] = 2
                else:
                    grid[i, j] = 3

        mesh = ax.pcolormesh(mu_vals, delta_vals, grid, shading="nearest", cmap=cmap, vmin=0, vmax=3)
        mesh.set_edgecolor("face")
        ax.set_xlim(left=0.0, right=2.0)
        ax.set_ylim(bottom=0.0, top=1.2)
        ax.set_xticks([0.5, 1.0, 1.5, 2.0])
        ax.set_yticks([0.5, 1.0])
        style_axes(ax, r"$\mu$", r"$\delta$")
        ax.xaxis.set_major_formatter(FuncFormatter(_half_tick))
        ax.yaxis.set_major_formatter(FuncFormatter(_half_tick))
        ax.set_title(fr"$q={q:.1f}$", pad=4)
        boundary = mu_vals / (2.0 * q)
        ax.plot(mu_vals, np.minimum(boundary, delta_vals[-1]), linestyle="--", linewidth=0.9, color="black")
        add_axis_arrows(ax)

    legend_items = [
        Patch(facecolor="#f2f2f2", edgecolor="black", label=r"$\Delta_I^{IU}\geq0,\ \Xi_U\geq0$"),
        Patch(facecolor="#d9d9d9", edgecolor="black", label=r"$\Delta_I^{IU}\geq0,\ \Xi_U<0$"),
        Patch(facecolor="#bdbdbd", edgecolor="black", label=r"$\Delta_I^{IU}<0,\ \Xi_U\geq0$"),
        Patch(facecolor="#969696", edgecolor="black", label=r"$\Delta_I^{IU}<0,\ \Xi_U<0$"),
    ]
    legend_x = (margin_l + n * panel_size + (n - 1) * gap + gap) / fig_w
    fig.legend(handles=legend_items, frameon=True, facecolor="white", edgecolor="black",
               fancybox=False, fontsize=8, loc="center left", bbox_to_anchor=(legend_x, 0.5))
    fig.savefig(FIGURES_DIR / "fig5_regions.pdf")
    plt.close(fig)


def render_payoff_comparison(q_values: tuple[float, ...] = (0.3, 0.5, 0.7)) -> None:
    V_L, v_h, mu = 0.4, 2.0, 1.2
    v = np.linspace(V_L, v_h, 600)
    iu = e_i_iu(v)

    fig, ax = plt.subplots(figsize=(6.5, 4.5))
    colors = ["black", "#555555", "#9a9a9a"]
    for q, color in zip(q_values, colors):
        ss = np.array([e_i_ss(V_L, v_h, q, x) for x in v])
        ax.plot(v, ss, linewidth=1.8, color=color, label=fr"$\pi_I^{{SS}}(v)$, $q={q:.1f}$")

    ax.plot(v, iu, linewidth=2.0, color="black", linestyle=(0, (5, 2.5)), label=r"$\pi_I^{IU}(v)$")
    ax.axvline(V_L, color="black", linestyle=":", linewidth=0.8, zorder=2)
    ax.axvline(v_h, color="black", linestyle=":", linewidth=0.8, zorder=2)
    ax.set_xlim(left=V_L, right=v_h)
    ax.set_ylim(bottom=0.0)
    ax.set_xticks([0.5, 1.0, 1.5, 2.0])
    ax.xaxis.set_major_formatter(FuncFormatter(_half_tick))
    style_axes(ax, r"$v$", "Payoff")
    ax.text(V_L, ax.get_ylim()[1] * 1.01, r"$V_\ell$", fontsize=9, ha="center", va="bottom")
    ax.text(v_h, ax.get_ylim()[1] * 1.01, r"$V_H$", fontsize=9, ha="center", va="bottom")
    ax.legend(frameon=True, facecolor="white", edgecolor="black", fancybox=False, loc="upper left", fontsize=8)
    ax.text(0.985, 0.02, rf"$(V_\ell,V_H,\mu,V)=({V_L:.1f},{v_h:.1f},{mu:.1f},{V:.0f})$",
            transform=ax.transAxes, ha="right", va="bottom", fontsize=9,
            bbox=dict(facecolor="white", edgecolor="0.35", linewidth=0.6, boxstyle="square,pad=0.3"))
    add_axis_arrows(ax)
    fig.subplots_adjust(left=0.10, right=0.98, bottom=0.13, top=0.93)
    fig.savefig(FIGURES_DIR / "fig5_payoffs.pdf", bbox_inches="tight")
    plt.close(fig)


def render_uniform_regions(v_values: tuple[float, ...] = (0.5, 1.0, 1.5)) -> None:
    mu_vals = np.linspace(0.2, 2.0, 241)
    delta_vals = np.linspace(0.0, 1.2, 221)
    cmap = ListedColormap(["#f2f2f2", "#cfcfcf", "#7f7f7f"])
    present: set[int] = set()

    n = len(v_values)
    panel_size, legend_w = 3.6, 1.85
    margin_l, margin_r, margin_b, margin_t, gap = 0.55, 0.15, 0.65, 0.45, 0.45
    fig_w = margin_l + n * panel_size + (n - 1) * gap + legend_w + margin_r
    fig_h = margin_b + panel_size + margin_t
    fig = plt.figure(figsize=(fig_w, fig_h))
    axes = []
    for k in range(n):
        left = (margin_l + k * (panel_size + gap)) / fig_w
        ax = fig.add_axes((left, margin_b / fig_h, panel_size / fig_w, panel_size / fig_h))
        axes.append(ax)

    for ax, prize_v in zip(axes, v_values):
        grid = np.full((len(delta_vals), len(mu_vals)), np.nan)
        for i, delta in enumerate(delta_vals):
            if delta <= 0:
                continue
            for j, mu in enumerate(mu_vals):
                if delta >= mu:
                    continue
                a, b = mu - delta, mu + delta
                support = np.linspace(a, b, 600)
                r_vals = uniform_r(support, mu, delta, prize_v)
                has_pos = np.any(r_vals > 1e-7)
                has_neg = np.any(r_vals < -1e-7)
                if has_pos and has_neg:
                    grid[i, j] = 0
                elif has_neg:
                    grid[i, j] = 1
                else:
                    grid[i, j] = 2
                present.add(int(grid[i, j]))

        mesh = ax.pcolormesh(mu_vals, delta_vals, grid, shading="nearest", cmap=cmap, vmin=0, vmax=2)
        mesh.set_edgecolor("face")
        ax.set_xlim(left=0.0, right=2.0)
        ax.set_ylim(bottom=0.0, top=1.2)
        ax.set_xticks([0.5, 1.0, 1.5, 2.0])
        ax.set_yticks([0.5, 1.0])
        style_axes(ax, r"$\mu$", r"$\delta$")
        ax.xaxis.set_major_formatter(FuncFormatter(_half_tick))
        ax.yaxis.set_major_formatter(FuncFormatter(_half_tick))
        ax.set_title(fr"$V={prize_v:.1f}$", pad=4)
        ax.plot(mu_vals, np.minimum(mu_vals, delta_vals[-1]), linestyle="--", linewidth=0.9, color="black")
        add_axis_arrows(ax)

    legend_specs = {
        0: ("#f2f2f2", "split by interior threshold"),
        1: ("#cfcfcf", r"all types prefer $IU$"),
        2: ("#7f7f7f", r"all types prefer $SS$"),
    }
    legend_items = [Patch(facecolor=legend_specs[k][0], edgecolor="black", label=legend_specs[k][1]) for k in sorted(present)]
    legend_x = (margin_l + n * panel_size + (n - 1) * gap + gap) / fig_w
    fig.legend(handles=legend_items, frameon=True, facecolor="white", edgecolor="black",
               fancybox=False, fontsize=8, loc="center left", bbox_to_anchor=(legend_x, 0.5))
    fig.savefig(FIGURES_DIR / "fig5_uniform_regions.pdf")
    plt.close(fig)


def main() -> None:
    apply_style()
    render_timing_regions()
    render_payoff_comparison()
    render_uniform_regions()


if __name__ == "__main__":
    main()
