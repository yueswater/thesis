#!/usr/bin/env python3
from __future__ import annotations

import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
os.environ.setdefault("MPLCONFIGDIR", str(ROOT / ".matplotlib"))

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np
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


def add_axis_arrows(ax: plt.Axes) -> None:
    x0, x1 = ax.get_xlim()
    y0, y1 = ax.get_ylim()
    ax.annotate(
        "",
        xy=(x1 * 1.01, y0),
        xytext=(x0, y0),
        arrowprops=dict(arrowstyle="-|>", lw=0.9, color="black"),
        annotation_clip=False,
    )
    ax.annotate(
        "",
        xy=(x0, y1 * 1.01),
        xytext=(x0, y0),
        arrowprops=dict(arrowstyle="-|>", lw=0.9, color="black"),
        annotation_clip=False,
    )


def s_star(q: np.ndarray, v_h: float, v_l: float) -> np.ndarray:
    numer = v_h**3 - v_l * (2 * v_h - v_l) * (q * v_h + (1 - q) * v_l)
    denom = v_h**2 * (v_h - v_l)
    return numer / denom


def render_qs_regions(v_h: float = 2.0, v_l: float = 1.0) -> None:
    q = np.linspace(0.5, 1.0, 400)
    s = s_star(q, v_h, v_l)

    fig, ax = plt.subplots(figsize=(6.2, 5.0))

    # Region I: separating (below boundary)
    q_sep = np.concatenate([np.linspace(0.5, 1.0, 260), q[::-1]])
    s_sep = np.concatenate([np.full(260, 0.5), s[::-1]])
    ax.fill(q_sep, s_sep, facecolor="0.92", edgecolor="none", zorder=1)
    ax.fill(
        q_sep,
        s_sep,
        facecolor="none",
        edgecolor="0.45",
        linewidth=0.6,
        zorder=2,
    )

    # Region II: pooling (above boundary)
    q_pool = np.concatenate([q, [1.0, 0.5, 0.5]])
    s_pool = np.concatenate([s, [1.0, 1.0, s[0]]])
    ax.fill(q_pool, s_pool, facecolor="0.70", edgecolor="none", zorder=1)
    ax.fill(
        q_pool,
        s_pool,
        facecolor="none",
        edgecolor="0.20",
        linewidth=0.6,
        zorder=2,
    )

    # Boundary
    ax.plot(q, s, color="black", linewidth=0.75, zorder=4, label=r"$s^{*}(q)$")

    # Benchmark / Fu points
    ax.plot(0.5, 0.5, marker="^", color="black", markersize=7, zorder=5)
    ax.plot(1.0, 1.0, marker="s", color="black", markersize=7, zorder=5)
    ax.annotate(
        r"Benchmark $(\frac{1}{2},\frac{1}{2})$",
        xy=(0.5, 0.5),
        xytext=(0.515, 0.555),
        fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
        va="bottom",
    )
    ax.annotate(
        r"Fu limit $(1,1)$",
        xy=(1.0, 1.0),
        xytext=(0.79, 0.97),
        fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
        va="top",
    )

    # Roman numerals
    ax.text(
        0.63,
        0.58,
        "I",
        fontsize=16,
        fontweight="bold",
        ha="center",
        va="center",
        color="black",
    )
    ax.text(
        0.83,
        0.89,
        "II",
        fontsize=16,
        fontweight="bold",
        ha="center",
        va="center",
        color="black",
    )

    ax.set_xlim(0.5, 1.0)
    ax.set_ylim(0.5, 1.0)
    ax.set_xticks([0.5, 0.6, 0.7, 0.8, 0.9, 1.0])
    ax.set_yticks([0.5, 0.6, 0.7, 0.8, 0.9, 1.0])
    style_axes(
        ax,
        r"$q=\Pr(v_U=V_H\mid v_I=V_H)$",
        r"$s=\Pr(v_U=V_L\mid v_I=V_L)$",
    )
    add_axis_arrows(ax)
    ax.set_aspect("equal", adjustable="box")

    legend_items = [
        Patch(facecolor="0.92", edgecolor="0.45", label="Region I: Separating"),
        Patch(facecolor="0.70", edgecolor="0.20", label="Region II: Pooling"),
        plt.Line2D([0], [0], color="black", linewidth=0.75, label=r"Boundary $s^*(q)$"),
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
    fig.savefig(FIG_DIR / "fig6_qs_regions.pdf", bbox_inches="tight")
    plt.close(fig)


if __name__ == "__main__":
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
    render_qs_regions()
