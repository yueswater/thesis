"""
English-language version of main_timing_region.py for the defense slides.

Same classification logic (imported from main_timing_region.classify); only the
typography and text are different: all-English labels/legend, Times New Roman
throughout (no Chinese font needed), and no per-panel title --- the v_H/v_L
ratio for each panel is stated in the slide's figure caption instead.
"""
from __future__ import annotations

import numpy as np

from main_timing_region import R_VALUES, classify

FONT_DIR = "fonts"
MATH_FONT_PATH = f"{FONT_DIR}/Times_New_Roman.ttf"
MATH_FONT_BOLD_PATH = f"{FONT_DIR}/Times_New_Roman_Bold.ttf"
MATH_FONT_ITALIC_PATH = f"{FONT_DIR}/Times_New_Roman_Italic.ttf"

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
    -1: "non-interior",
    0: "no PSNE",
    1: "IU only",
    2: "SS only",
    3: "UI only",
    4: "IU & SS overlap",
    5: "IU & UI overlap",
    6: "SS & UI overlap",
    7: "all three overlap",
}


def _setup_fonts():
    import matplotlib.font_manager as fm
    from matplotlib import rcParams

    fm.fontManager.addfont(MATH_FONT_PATH)
    fm.fontManager.addfont(MATH_FONT_BOLD_PATH)
    fm.fontManager.addfont(MATH_FONT_ITALIC_PATH)
    math_name = fm.FontProperties(fname=MATH_FONT_PATH).get_name()

    rcParams["font.family"] = math_name
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
        ax.set_xlabel("$q$ (high-type probability)")

        ax.xaxis.set_major_formatter(fmt)
        ax.yaxis.set_major_formatter(fmt)
        for tick, val in zip(ax.xaxis.get_major_ticks(), ax.get_xticks()):
            if abs(val) < 1e-9:
                tick.label1.set_visible(False)

    axes[0].set_ylabel(r"$\rho$ (correlation coefficient)")

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

    out = "main_timing_region-en.png"
    fig.savefig(out, dpi=1200, bbox_inches="tight")
    print("saved:", out)

    out_pdf = "main_timing_region-en.pdf"
    fig.savefig(out_pdf, dpi=600, bbox_inches="tight", transparent=True)
    print("saved:", out_pdf)


if __name__ == "__main__":
    results = []
    for R in R_VALUES:
        qs, rhos, cat, rho_star_q = classify(R)
        results.append((R, qs, rhos, cat, rho_star_q))
        print()
    plot_all(results)
