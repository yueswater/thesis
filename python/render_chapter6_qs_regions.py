#!/usr/bin/env python3
from __future__ import annotations

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.lines import Line2D
from matplotlib.patches import Patch

from paths import FIGURES_DIR as FIG_DIR


def style_axes(ax: plt.Axes, xlabel: str, ylabel: str) -> None:
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.tick_params(direction="out", length=4, width=0.8)


def boundary(p_h: np.ndarray, v_h: float, V_L: float) -> np.ndarray:
    r = v_h**2 / (V_L * (2.0 * v_h - V_L))
    return (r * v_h - V_L - p_h * (v_h - V_L)) / (r * (v_h - V_L))


def render_ph_pl_regions(v_h: float = 2.0, V_L: float = 1.0) -> None:
    p_h = np.linspace(0.0, 1.0, 401)
    p_L = np.linspace(0.0, 1.0, 401)
    p_h_grid, p_L_grid = np.meshgrid(p_h, p_L)
    region = np.where(p_L_grid <= boundary(p_h_grid, v_h, V_L), 0, 1)

    fig, ax = plt.subplots(figsize=(6.2, 5.1))
    ax.contourf(
        p_h_grid,
        p_L_grid,
        region,
        levels=[-0.5, 0.5, 1.5],
        colors=["#E8E8E8", "#8D8D8D"],
        antialiased=False,
        zorder=1,
    )

    p_h_line = np.linspace(0.0, 1.0, 600)
    p_L_line = boundary(p_h_line, v_h, V_L)
    mask = (p_L_line >= 0.0) & (p_L_line <= 1.0)
    ax.plot(p_h_line[mask], p_L_line[mask], color="black", linewidth=0.9, zorder=4)

    point_specs = (
        ("A", 0.3, (0.020, 0.020)),
        ("B", 0.5, (0.020, 0.020)),
        ("C", 0.7, (0.020, 0.020)),
    )
    for label, q, offset in point_specs:
        ax.plot(q, 1.0 - q, marker="o", color="black", markersize=4.8, zorder=5)
        ax.text(
            q + offset[0],
            1.0 - q + offset[1],
            label,
            fontsize=9,
            color="black",
            fontweight="bold",
        )

    ax.plot(1.0, 1.0, marker="s", color="black", markersize=6.5, zorder=5)
    ax.annotate(
        "$(1,1)$\nPerfect Correlation",
        xy=(1.0, 1.0),
        xytext=(0.62, 0.86),
        fontsize=10,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
    )

    ax.text(0.20, 0.22, "I", fontsize=18, color="black")
    ax.text(0.86, 0.70, "II", fontsize=18, color="black")

    style_axes(
        ax,
        r"$p_H=\Pr(V_U=V_H\mid V_I=V_H)$",
        r"$p_\ell=\Pr(V_U=V_\ell\mid V_I=V_\ell)$",
    )
    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    ax.set_aspect("equal", adjustable="box")

    legend_items = [
        Patch(facecolor="#E8E8E8", edgecolor="black", linewidth=0.4, label="Region I (Separating)"),
        Patch(facecolor="#8D8D8D", edgecolor="black", linewidth=0.4, label="Region II (Pooling)"),
        Line2D([0], [0], color="black", linewidth=0.9, label=r"Critical boundary $p_\ell^*(p_H)$"),
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
    fig.savefig(FIG_DIR / "fig6_qs_regions.png", dpi=300, bbox_inches="tight")
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
    render_ph_pl_regions()


if __name__ == "__main__":
    main()
