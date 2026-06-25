"""
Stage-0 timing phase diagram for the partial-correlation model (Ch4 04_main_model.typ).

For fixed v_L = 1, v_H = R, classify each (q, rho) in (0,1) x [0,1] by which
stage-0 pure-strategy Nash equilibrium prevails, using lem-main-timing-characterization:

  UI iff D_I^UI >= 0 and D_U^UI >= 0
  SS iff D_I^UI <= 0 and D_U^IU <= 0
  IU iff D_I^IU >= 0 and D_U^IU >= 0

where D_X^J = pi_tilde_X^J - pi_tilde_X^SS, and the IU subgame continuation is the
separating equilibrium throughout (undistorted for rho <= rho*(q), Riley-distorted
for rho > rho*(q), per prop-main-iu-rho-star / prop-main-iu-riley).

Produces one region map per R in R_VALUES, batched, saved next to this script.
"""
from __future__ import annotations

import numpy as np

R_VALUES = [2.0, 4.0, 8.0]
N = 3000


def classify(R: float):
    qs = np.linspace(1e-3, 1 - 1e-3, N)
    rhos = np.linspace(0.0, 1.0, N)
    Q, RHO = np.meshgrid(qs, rhos)

    vL, vH = 1.0, R
    dV = vH - vL
    Vbar = Q * vH + (1 - Q) * vL

    VU1 = vL + (Q + RHO * (1 - Q)) * dV
    VU0 = vL + Q * (1 - RHO) * dV

    # SS subgame
    tildeA = Q * VU1 / np.sqrt(vH) + (1 - Q) * VU0 / np.sqrt(vL)
    tildeB = Q * VU1 / vH + (1 - Q) * VU0 / vL
    cSS = tildeA / (1 + tildeB)
    piI_SS = lambda v: (np.sqrt(v) - cSS) ** 2  # noqa: E731
    piI_SS_t = Q * piI_SS(vH) + (1 - Q) * piI_SS(vL)
    piU_SS_t = tildeA ** 2 * tildeB / (1 + tildeB) ** 2

    # UI subgame
    cUI = tildeA / 2
    piI_UI = lambda v: (np.sqrt(v) - cUI) ** 2  # noqa: E731
    piI_UI_t = Q * piI_UI(vH) + (1 - Q) * piI_UI(vL)
    piU_UI_t = tildeA ** 2 / 4

    # IU subgame: separating, undistorted for rho<=rho*, Riley for rho>rho*
    R_imit = vH ** 2 / (vL * (2 * vH - vL))
    rho_star_q = (R_imit - 1) / (1 + qs * (R_imit - 1)) * (qs * vH + (1 - qs) * vL) / dV
    rho_star_grid = np.broadcast_to(rho_star_q, RHO.shape)

    xH = vH ** 2 / (4 * VU1)
    piH = xH

    xL_undist = vL ** 2 / (4 * VU0)
    piL_undist = xL_undist

    alpha = 1 - VU0 / VU1
    alpha = np.clip(alpha, 0.0, 1.0)
    zH_minus = vH / (2 * np.sqrt(VU0)) * (1 - np.sqrt(alpha))
    xL_riley = zH_minus ** 2
    piL_riley = vL * np.sqrt(xL_riley / VU0) - xL_riley

    riley = RHO > rho_star_grid
    xL = np.where(riley, xL_riley, xL_undist)
    piL = np.where(riley, piL_riley, piL_undist)

    piI_IU_t = Q * piH + (1 - Q) * piL
    piU_path_H = (np.sqrt(VU1) - np.sqrt(xH)) ** 2
    piU_path_L = (np.sqrt(VU0) - np.sqrt(xL)) ** 2
    piU_IU_t = Q * piU_path_H + (1 - Q) * piU_path_L

    D_I_UI = piI_UI_t - piI_SS_t
    D_U_UI = piU_UI_t - piU_SS_t
    D_I_IU = piI_IU_t - piI_SS_t
    D_U_IU = piU_IU_t - piU_SS_t

    ui_ok = (D_I_UI >= 0) & (D_U_UI >= 0)
    ss_ok = (D_I_UI <= 0) & (D_U_IU <= 0)
    iu_ok = (D_I_IU >= 0) & (D_U_IU >= 0)

    interior_SS = vL >= cSS
    interior_UI = vL >= cUI
    interior = interior_SS & interior_UI

    cat = np.full(RHO.shape, -1, dtype=int)  # -1 = non-interior
    cat[interior & ~iu_ok & ~ss_ok & ~ui_ok] = 0  # no PSNE
    cat[interior & iu_ok & ~ss_ok & ~ui_ok] = 1  # IU only
    cat[interior & ~iu_ok & ss_ok & ~ui_ok] = 2  # SS only
    cat[interior & ~iu_ok & ~ss_ok & ui_ok] = 3  # UI only
    cat[interior & iu_ok & ss_ok & ~ui_ok] = 4  # IU & SS overlap
    cat[interior & iu_ok & ~ss_ok & ui_ok] = 5  # IU & UI overlap
    cat[interior & ~iu_ok & ss_ok & ui_ok] = 6  # SS & UI overlap
    cat[interior & iu_ok & ss_ok & ui_ok] = 7  # all three

    # UI is only ever a PSNE on the measure-zero edge rho=1; not worth a dedicated
    # color, so fold the last row into whatever the row below it shows.
    cat[-1, :] = cat[-2, :]

    print(f"R={R}: category pixel counts (interior={interior.sum()}/{interior.size}):")
    for k in range(-1, 8):
        n = int((cat == k).sum())
        if n:
            print(f"  cat {k}: {n}")

    return qs, rhos, cat, rho_star_q


FONT_DIR = "fonts"
ZH_FONT_PATH = f"{FONT_DIR}/TaiwanPearl-Light.ttf"
MATH_FONT_PATH = f"{FONT_DIR}/Times_New_Roman.ttf"
MATH_FONT_BOLD_PATH = f"{FONT_DIR}/Times_New_Roman_Bold.ttf"
MATH_FONT_ITALIC_PATH = f"{FONT_DIR}/Times_New_Roman_Italic.ttf"

# grayscale, no pure black: 0 = no PSNE, -1 = non-interior
GRAYS = {
    -1: "#ffffff",  # non-interior
    0: "#595959",   # no PSNE
    1: "#cfcfcf",   # IU only
    2: "#8c8c8c",   # SS only
    3: "#404040",   # UI only
    4: "#b0b0b0",   # IU & SS
    5: "#707070",   # IU & UI
    6: "#a0a0a0",   # SS & UI
    7: "#333333",   # all three
}
LABELS = {
    -1: "非內點",
    0: "無純策略均衡",
    1: "IU 唯一均衡",
    2: "SS 唯一均衡",
    3: "UI 唯一均衡",
    4: "IU 與 SS 重疊",
    5: "IU 與 UI 重疊",
    6: "SS 與 UI 重疊",
    7: "三者重疊",
}


def _setup_fonts():
    import matplotlib.font_manager as fm
    from matplotlib import rcParams

    fm.fontManager.addfont(ZH_FONT_PATH)
    fm.fontManager.addfont(MATH_FONT_PATH)
    fm.fontManager.addfont(MATH_FONT_BOLD_PATH)
    fm.fontManager.addfont(MATH_FONT_ITALIC_PATH)
    zh_name = fm.FontProperties(fname=ZH_FONT_PATH).get_name()
    math_name = fm.FontProperties(fname=MATH_FONT_PATH).get_name()

    rcParams["font.family"] = zh_name
    rcParams["axes.unicode_minus"] = False
    rcParams["pdf.fonttype"] = 42
    rcParams["mathtext.fontset"] = "custom"
    rcParams["mathtext.rm"] = math_name
    rcParams["mathtext.it"] = f"{math_name}:italic"
    rcParams["mathtext.bf"] = f"{math_name}:bold"
    rcParams["mathtext.default"] = "it"


def plot_all(results):
    import matplotlib
    matplotlib.use("Agg")
    _setup_fonts()
    import matplotlib.pyplot as plt
    import matplotlib.patches as mpatches
    from matplotlib.colors import ListedColormap, BoundaryNorm
    from matplotlib.ticker import FuncFormatter

    keys = list(range(-1, 8))
    cmap = ListedColormap([GRAYS[k] for k in keys])
    norm = BoundaryNorm(np.arange(-1.5, 8.5, 1), cmap.N)
    fmt = FuncFormatter(lambda v, _: "${:g}$".format(v))

    n = len(results)
    fig, axes = plt.subplots(1, n, figsize=(4.6 * n, 5), sharey=True)
    present = set()

    for ax, (R, qs, rhos, cat, rho_star_q) in zip(axes, results):
        present.update(cat.flatten().tolist())
        ax.pcolormesh(qs, rhos, cat, cmap=cmap, norm=norm, shading="auto", rasterized=True)
        ax.plot(qs, rho_star_q, color="black", lw=1.1, ls="--")
        ax.set_xlabel("$q$（高型別機率）")
        ax.set_title(rf"$\dfrac{{v_H}}{{v_L}}={R:g}$", pad=10)

        ax.xaxis.set_major_formatter(fmt)
        ax.yaxis.set_major_formatter(fmt)
        for tick, val in zip(ax.xaxis.get_major_ticks(), ax.get_xticks()):
            if abs(val) < 1e-9:
                tick.label1.set_visible(False)

    axes[0].set_ylabel(r"$\rho$（相關係數）")

    # darkest to lightest, by mean RGB
    def _darkness(k):
        c = GRAYS[k].lstrip("#")
        return sum(int(c[i:i + 2], 16) for i in (0, 2, 4))

    ordered_keys = sorted((k for k in keys if k in present), key=_darkness)
    handles = [
        mpatches.Patch(facecolor=GRAYS[k], edgecolor="black", linewidth=0.4, label=LABELS[k])
        for k in ordered_keys
    ]
    handles.append(plt.Line2D([0], [0], color="black", lw=1.1, ls="--", label=r"$\rho^*(q)$"))
    fig.legend(handles=handles, loc="center left", bbox_to_anchor=(1.0, 0.5), fontsize=9, frameon=False)
    fig.tight_layout(rect=(0, 0, 1, 1))

    out = "main_timing_region.png"
    fig.savefig(out, dpi=1200, bbox_inches="tight")
    print("saved:", out)

    out_pdf = "main_timing_region.pdf"
    fig.savefig(out_pdf, dpi=600, bbox_inches="tight", transparent=True)
    print("saved:", out_pdf)


if __name__ == "__main__":
    results = []
    for R in R_VALUES:
        qs, rhos, cat, rho_star_q = classify(R)
        results.append((R, qs, rhos, cat, rho_star_q))
        print()
    plot_all(results)
