#!/usr/bin/env python3
"""Phase diagram for §6.5 (pooling equilibrium).

Overlays the separating-equilibrium critical boundary (from §6.3) and the
pooling-equilibrium non-degeneracy boundary (from §6.5) on the (p_H, p_l)
plane, partitioning it into three regions:

  * Region I  – separating only      (white / lightest fill)
  * Region C  – coexistence          (light gray)
  * Region II – pooling only         (medium gray)

To remain consistent with the rest of this project's figure pipeline
(see render_chapter6_qs_regions.py), this script uses matplotlib's
mathtext engine with Times New Roman, *not* a real LaTeX install. If a
working TeX distribution is available and you want true LaTeX rendering
of the labels, set ``plt.rcParams['text.usetex'] = True`` in ``main()``;
the math markup with ``$...$`` will then be typeset by LaTeX directly.
"""

from __future__ import annotations

import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
os.environ.setdefault("MPLCONFIGDIR", str(ROOT / ".matplotlib"))

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.lines import Line2D
from matplotlib.patches import Patch


FIG_DIR = ROOT / "figures"
FIG_DIR.mkdir(exist_ok=True)
(ROOT / ".matplotlib").mkdir(exist_ok=True)


def style_axes(ax: plt.Axes, xlabel: str, ylabel: str) -> None:
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.tick_params(direction="out", length=4, width=0.8)


def separating_boundary(p_h: np.ndarray, V_H: float, V_L: float) -> np.ndarray:
    """V_U(1) / V_U(0) = R   =>   p_l = ((R-1) V_H - p_h (V_H - V_L)) / (R (V_H - V_L))."""
    R = V_H**2 / (V_L * (2.0 * V_H - V_L))
    return (R * V_H - V_L - p_h * (V_H - V_L)) / (R * (V_H - V_L))


def pooling_boundary(p_h: np.ndarray, V_H: float, V_L: float, q: float) -> np.ndarray:
    r"""sqrt(alpha) = (V_H - V_L)/(V_H + V_L), with
    alpha = 1 - V_U(q)/V_U(1) = (1-q) (V_U(1) - V_U(0)) / V_U(1).

    Solving for p_l yields a linear function of p_h. Let
        k  = ((V_H - V_L)/(V_H + V_L))^2
        D  = V_H - V_L,
        A  = V_L + p_h * D                       (= V_U(1))
        V0 = (1 - p_l) V_H + p_l V_L = V_H - p_l * D
    Then alpha = (1-q)(A - V0)/A and the threshold becomes
        (1-q) (A - V_H + p_l D) = k A
        p_l = [k A / (1-q) + V_H - A] / D.
    """
    k = ((V_H - V_L) / (V_H + V_L)) ** 2
    A = V_L + p_h * (V_H - V_L)
    return (k * A / (1.0 - q) + V_H - A) / (V_H - V_L)


def render_pooling_regions(
    V_H: float = 2.0,
    V_L: float = 1.0,
    q: float = 0.5,
) -> None:
    grid = np.linspace(0.0, 1.0, 401)
    PH, PL = np.meshgrid(grid, grid)

    sep_line_pl = separating_boundary(PH, V_H, V_L)
    pool_line_pl = pooling_boundary(PH, V_H, V_L, q)

    sep_ok = PL <= sep_line_pl                # separating equilibrium holds
    pool_ok = PL >= pool_line_pl              # pooling equilibrium exists

    region = np.full(PH.shape, np.nan)
    region[sep_ok & ~pool_ok] = 0             # Region I (separating only)
    region[sep_ok & pool_ok] = 1              # Coexistence
    region[~sep_ok & pool_ok] = 2             # Region II (pooling only)

    fig, ax = plt.subplots(figsize=(6.4, 5.2))
    ax.contourf(
        PH,
        PL,
        region,
        levels=[-0.5, 0.5, 1.5, 2.5],
        colors=["#F2F2F2", "#C8C8C8", "#8D8D8D"],
        antialiased=False,
        zorder=1,
    )

    p_h_line = np.linspace(0.0, 1.0, 800)
    sep_curve = separating_boundary(p_h_line, V_H, V_L)
    pool_curve = pooling_boundary(p_h_line, V_H, V_L, q)
    sep_mask = (sep_curve >= 0.0) & (sep_curve <= 1.0)
    pool_mask = (pool_curve >= 0.0) & (pool_curve <= 1.0)

    ax.plot(
        p_h_line[sep_mask],
        sep_curve[sep_mask],
        color="black",
        linewidth=1.1,
        linestyle="-",
        zorder=4,
    )
    ax.plot(
        p_h_line[pool_mask],
        pool_curve[pool_mask],
        color="black",
        linewidth=1.1,
        linestyle="--",
        zorder=4,
    )

    # Independence reference point (q, 1-q) — falls in pure Region I
    ax.plot(q, 1.0 - q, marker="o", color="black", markersize=5.0, zorder=5)
    ax.annotate(
        "$(q,\\,1-q)$",
        xy=(q, 1.0 - q),
        xytext=(q - 0.18, 1.0 - q - 0.12),
        fontsize=10,
        arrowprops=dict(arrowstyle="->", lw=0.7, color="black"),
    )

    ax.plot(1.0, 1.0, marker="s", color="black", markersize=6.5, zorder=5)
    ax.annotate(
        "$(1,1)$\nPerfect Correlation",
        xy=(1.0, 1.0),
        xytext=(0.58, 0.86),
        fontsize=10,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
    )

    ax.text(0.20, 0.20, "I", fontsize=18, color="black")
    ax.text(0.78, 0.62, "C", fontsize=16, color="black")
    ax.text(0.92, 0.85, "II", fontsize=18, color="white")

    style_axes(
        ax,
        r"$p_H=\Pr(V_U=V_H\mid V_I=V_H)$",
        r"$p_\ell=\Pr(V_U=V_\ell\mid V_I=V_\ell)$",
    )
    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    ax.set_aspect("equal", adjustable="box")

    legend_items = [
        Patch(facecolor="#F2F2F2", edgecolor="black", linewidth=0.4,
              label="Region I (Separating only)"),
        Patch(facecolor="#C8C8C8", edgecolor="black", linewidth=0.4,
              label="Region C (Coexistence)"),
        Patch(facecolor="#8D8D8D", edgecolor="black", linewidth=0.4,
              label="Region II (Pooling only)"),
        Line2D([0], [0], color="black", linewidth=1.1, linestyle="-",
               label=r"Separating boundary $p_\ell^*(p_H)$"),
        Line2D([0], [0], color="black", linewidth=1.1, linestyle="--",
               label=r"Pooling boundary $\sqrt{\alpha}=(V_H-V_\ell)/(V_H+V_\ell)$"),
    ]
    ax.legend(
        handles=legend_items,
        loc="center left",
        bbox_to_anchor=(1.02, 0.5),
        fontsize=8,
        frameon=True,
        facecolor="white",
        edgecolor="black",
        fancybox=False,
    )

    fig.tight_layout()
    fig.savefig(FIG_DIR / "fig6_pooling_regions.pdf", bbox_inches="tight")
    plt.close(fig)


def main() -> None:
    plt.rcParams.update(
        {
            "font.family": "Times New Roman",
            "font.size": 10,
            "axes.labelsize": 10,
            "legend.fontsize": 8,
            "xtick.labelsize": 9,
            "ytick.labelsize": 9,
            "mathtext.fontset": "stix",
            "mathtext.rm": "Times New Roman",
            "mathtext.it": "Times New Roman:italic",
            "mathtext.bf": "Times New Roman:bold",
        }
    )
    render_pooling_regions()


if __name__ == "__main__":
    main()
