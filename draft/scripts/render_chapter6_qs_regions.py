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


def s_star_h(q: np.ndarray, v_h: float, v_l: float) -> np.ndarray:
    numer = v_h**3 - v_l * (2 * v_h - v_l) * (q * v_h + (1 - q) * v_l)
    denom = v_h**2 * (v_h - v_l)
    return numer / denom


def s_star_l(q: np.ndarray, v_h: float, v_l: float) -> np.ndarray:
    if not (v_h > v_l > 0):
        raise ValueError("Require v_h > v_l > 0")
    if 2 * v_l <= v_h:
        return np.full_like(q, np.nan, dtype=float)

    numer = v_h**2 * (2 * v_l - v_h) - v_l**2 * (q * v_h + (1 - q) * v_l)
    denom = v_h * (2 * v_l - v_h) * (v_h - v_l)
    return numer / denom


def render_qs_regions(v_h: float = 2.0, v_l: float = 1.0) -> None:
    """Legacy figure used in Section 6.3 (q,s in [0.5, 1])."""
    q = np.linspace(0.5, 1.0, 400)
    s = s_star_h(q, v_h, v_l)

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
        Line2D([0], [0], color="black", linewidth=0.75, label=r"Boundary $s^*(q)$"),
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


def render_qs_regions_full(v_h: float = 1.9, v_l: float = 1.0) -> None:
    """Full-domain figure for Section 6.4 on q,s in [0,1]."""
    if not (v_h > v_l > 0):
        raise ValueError("Require v_h > v_l > 0")

    q = np.linspace(0.0, 1.0, 801)
    s = np.linspace(0.0, 1.0, 801)
    q_grid, s_grid = np.meshgrid(q, s)

    s_h_grid = s_star_h(q_grid, v_h, v_l)
    s_l_grid = s_star_l(q_grid, v_h, v_l)

    upper = q_grid + s_grid >= 1.0
    lower = ~upper

    # 0: separating (A), 1: pooling high-mimic (B), 2: pooling low-bluff (C)
    region = np.zeros_like(q_grid, dtype=int)
    region[upper & (s_grid > s_h_grid)] = 1
    region[lower & np.isfinite(s_l_grid) & (s_grid < s_l_grid)] = 2

    fig, ax = plt.subplots(figsize=(6.8, 5.8))

    levels = [-0.5, 0.5, 1.5, 2.5]
    # Solid grayscale palette only (no hatching).
    fill_colors = ["#E8E8E8", "#A0A0A0", "#606060"]

    ax.contourf(
        q_grid,
        s_grid,
        region,
        levels=levels,
        colors=fill_colors,
        antialiased=False,
        zorder=1,
    )
    q_line = np.linspace(0.0, 1.0, 2000)
    diag = 1.0 - q_line
    s_h_line = s_star_h(q_line, v_h, v_l)
    s_l_line = s_star_l(q_line, v_h, v_l)

    mask_h = (s_h_line >= 0.0) & (s_h_line <= 1.0) & (s_h_line >= diag)
    mask_l = np.isfinite(s_l_line) & (s_l_line >= 0.0) & (s_l_line <= 1.0) & (s_l_line <= diag)

    if np.any(mask_h):
        ax.plot(
            q_line[mask_h],
            s_h_line[mask_h],
            color="black",
            linewidth=1.05,
            zorder=5,
            label=r"$s_H^*(q)$ ($IC_H$ binding)",
        )

    if np.any(mask_l):
        ax.plot(
            q_line[mask_l],
            s_l_line[mask_l],
            color="black",
            linewidth=1.05,
            linestyle="--",
            zorder=5,
            label=r"$s_L^*(q)$ ($IC_L$ binding)",
        )

    ax.plot(
        q_line,
        diag,
        color="0.2",
        linewidth=0.9,
        linestyle=":",
        zorder=4,
        label=r"$q+s=1$",
    )

    # Visual anchor: prove the IC_H boundary still passes the benchmark q=0.5.
    q_anchor = 0.5
    s_anchor = float(s_star_h(np.array([q_anchor]), v_h, v_l)[0])
    ax.plot(q_anchor, s_anchor, marker="o", color="black", markersize=8, zorder=7)
    ax.annotate(
        "Benchmark (0.5, ~0.88)",
        xy=(q_anchor, s_anchor),
        xytext=(0.57, min(0.96, s_anchor + 0.08)),
        fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.9, color="black"),
    )

    # Extreme points and labels
    ax.plot(1.0, 1.0, marker="s", color="black", markersize=6, zorder=6)
    ax.plot(0.0, 0.0, marker="o", color="black", markersize=5, zorder=6)

    ax.annotate(
        "Fu (2006) limit $(1,1)$",
        xy=(1.0, 1.0),
        xytext=(0.73, 0.97),
        fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
        va="top",
    )
    ax.annotate(
        "Negative-correlation extreme $(0,0)$",
        xy=(0.0, 0.0),
        xytext=(0.03, 0.10),
        fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
    )

    ax.text(0.56, 0.56, "A", fontsize=15, fontweight="bold", ha="center", va="center")
    ax.text(0.82, 0.84, "B", fontsize=15, fontweight="bold", ha="center", va="center")
    ax.text(0.16, 0.15, "C", fontsize=15, fontweight="bold", ha="center", va="center")

    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    ax.set_xticks(np.linspace(0.0, 1.0, 6))
    ax.set_yticks(np.linspace(0.0, 1.0, 6))
    style_axes(
        ax,
        r"$q=\Pr(v_U=V_H\mid v_I=V_H)$",
        r"$s=\Pr(v_U=V_L\mid v_I=V_L)$",
    )
    add_axis_arrows(ax)
    ax.set_aspect("equal", adjustable="box")

    legend_items = [
        Patch(facecolor="#E8E8E8", edgecolor="black", label="A: Separating Equilibrium"),
        Patch(facecolor="#A0A0A0", edgecolor="black", label="B: Pooling - High Type Mimics"),
        Patch(facecolor="#606060", edgecolor="black", label="C: Pooling - Low Type Bluffs"),
        Line2D([0], [0], color="black", linewidth=1.05, label=r"$s_H^*(q)$"),
    ]
    if np.any(mask_l):
        legend_items.append(
            Line2D([0], [0], color="black", linewidth=1.05, linestyle="--", label=r"$s_L^*(q)$")
        )
    legend_items.append(
        Line2D([0], [0], color="0.2", linewidth=0.9, linestyle=":", label=r"$q+s=1$")
    )

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

    ax.text(
        0.0,
        -0.18,
        rf"Parameterization: $V_H={v_h:.2f},\ V_L={v_l:.2f}$",
        transform=ax.transAxes,
        fontsize=8,
    )

    fig.tight_layout()
    fig.savefig(FIG_DIR / "fig6_qs_regions_full.pdf", bbox_inches="tight")
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

    render_qs_regions(v_h=2.0, v_l=1.0)
    render_qs_regions_full(v_h=1.9, v_l=1.0)
