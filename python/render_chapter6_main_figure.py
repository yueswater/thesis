#!/usr/bin/env python3
"""Main phase diagram for Section 6.4: full (q,s) plane with Region III added."""
from __future__ import annotations

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.lines import Line2D
from matplotlib.patches import Patch

from paths import FIGURES_DIR as FIG_DIR


def style_axes(ax, xlabel, ylabel):
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.tick_params(direction="out", length=4, width=0.8)


def add_axis_arrows(ax):
    x0, x1 = ax.get_xlim()
    y0, y1 = ax.get_ylim()
    ax.annotate("", xy=(x1 * 1.01, y0), xytext=(x0, y0),
                arrowprops=dict(arrowstyle="-|>", lw=0.9, color="black"),
                annotation_clip=False)
    ax.annotate("", xy=(x0, y1 * 1.01), xytext=(x0, y0),
                arrowprops=dict(arrowstyle="-|>", lw=0.9, color="black"),
                annotation_clip=False)


def s_star_h(q, v_h, v_l):
    numer = v_h**3 - v_l * (2 * v_h - v_l) * (q * v_h + (1 - q) * v_l)
    denom = v_h**2 * (v_h - v_l)
    return numer / denom


def s_star_l(q, v_h, v_l):
    if 2 * v_l <= v_h:
        return np.full_like(q, np.nan, dtype=float)
    numer = v_h**2 * (2 * v_l - v_h) - v_l**2 * (q * v_h + (1 - q) * v_l)
    denom = v_h * (2 * v_l - v_h) * (v_h - v_l)
    return numer / denom


def render_main_figure(v_h, v_l):
    q = np.linspace(0.0, 1.0, 1001)
    s = np.linspace(0.0, 1.0, 1001)
    q_grid, s_grid = np.meshgrid(q, s)

    s_h_grid = s_star_h(q_grid, v_h, v_l)
    s_l_grid = s_star_l(q_grid, v_h, v_l)

    upper = q_grid + s_grid >= 1.0
    lower = ~upper

    region = np.zeros_like(q_grid, dtype=int)
    region[upper & (s_grid > s_h_grid)] = 1  # II: high mimics low
    region[lower & np.isfinite(s_l_grid) & (s_grid < s_l_grid)] = 2  # III: low bluffs

    fig, ax = plt.subplots(figsize=(7.0, 6.0))

    levels = [-0.5, 0.5, 1.5, 2.5]
    fill_colors = ["#E8E8E8", "#A0A0A0", "#606060"]

    ax.contourf(q_grid, s_grid, region, levels=levels, colors=fill_colors,
                antialiased=False, zorder=1)

    q_line = np.linspace(0.0, 1.0, 2000)
    diag = 1.0 - q_line
    s_h_line = s_star_h(q_line, v_h, v_l)
    s_l_line = s_star_l(q_line, v_h, v_l)

    mask_h = (s_h_line >= 0.0) & (s_h_line <= 1.0) & (s_h_line >= diag)
    mask_l = (np.isfinite(s_l_line) & (s_l_line >= 0.0)
              & (s_l_line <= 1.0) & (s_l_line <= diag))

    if np.any(mask_h):
        ax.plot(q_line[mask_h], s_h_line[mask_h], color="black",
                linewidth=1.1, zorder=5)
    if np.any(mask_l):
        ax.plot(q_line[mask_l], s_l_line[mask_l], color="black",
                linewidth=1.1, linestyle="--", zorder=5)

    ax.plot(q_line, diag, color="0.25", linewidth=0.85, linestyle=":", zorder=4)

    # Benchmark anchor on IC_H boundary at q=0.5
    q_anchor = 0.5
    s_anchor = float(s_star_h(np.array([q_anchor]), v_h, v_l)[0])
    ax.plot(q_anchor, s_anchor, marker="o", color="black", markersize=8, zorder=7)
    ax.annotate(f"Benchmark $(0.5, {s_anchor:.3f})$",
                xy=(q_anchor, s_anchor),
                xytext=(0.58, min(0.95, s_anchor + 0.07)),
                fontsize=9,
                arrowprops=dict(arrowstyle="->", lw=0.9, color="black"))

    ax.plot(1.0, 1.0, marker="s", color="black", markersize=7, zorder=6)
    ax.plot(0.0, 0.0, marker="o", color="black", markersize=6, zorder=6)

    ax.annotate("#c("fu2006") limit $(1,1)$", xy=(1.0, 1.0),
                xytext=(0.70, 0.965), fontsize=9,
                arrowprops=dict(arrowstyle="->", lw=0.85, color="black"),
                va="top")
    ax.annotate("Negative-correlation\nextreme $(0,0)$", xy=(0.0, 0.0),
                xytext=(0.30, 0.05), fontsize=9, ha="left",
                arrowprops=dict(arrowstyle="->", lw=0.85, color="black"))

    # Region labels (Roman numerals to match thesis text)
    ax.text(0.58, 0.40, "I", fontsize=20, fontweight="bold",
            ha="center", va="center", color="black")
    ax.text(0.83, 0.85, "II", fontsize=20, fontweight="bold",
            ha="center", va="center", color="black")
    if np.any(mask_l):
        ax.text(0.13, 0.22, "III", fontsize=20, fontweight="bold",
                ha="center", va="center", color="white")

    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    ax.set_xticks(np.linspace(0.0, 1.0, 6))
    ax.set_yticks(np.linspace(0.0, 1.0, 6))
    style_axes(ax, r"$q = \Pr(v_U = V_H \mid v_I = V_H)$",
               r"$s = \Pr(v_U = V_L \mid v_I = V_L)$")
    add_axis_arrows(ax)
    ax.set_aspect("equal", adjustable="box")

    legend_items = [
        Patch(facecolor="#E8E8E8", edgecolor="black",
              label="I: Separating equilibrium"),
        Patch(facecolor="#A0A0A0", edgecolor="black",
              label="II: Pooling - high type mimics low"),
        Patch(facecolor="#606060", edgecolor="black",
              label="III: Pooling - low type bluffs high"),
        Line2D([0], [0], color="black", linewidth=1.1,
               label=r"$s_H^*(q)$  ($IC_H$ binding)"),
        Line2D([0], [0], color="black", linewidth=1.1, linestyle="--",
               label=r"$s_L^*(q)$  ($IC_L$ binding)"),
        Line2D([0], [0], color="0.25", linewidth=0.85, linestyle=":",
               label=r"$q + s = 1$  (independence)"),
    ]

    ax.legend(handles=legend_items, loc="center left",
              bbox_to_anchor=(1.03, 0.5), fontsize=8.5, frameon=True,
              facecolor="white", edgecolor="black", fancybox=False)

    ax.text(0.0, -0.15,
            rf"Parameterization: $V_H = {v_h:.2f},\ V_L = {v_l:.2f}$"
            rf" $\;(\rho = V_H/V_L = {v_h/v_l:.3f} < \varphi \approx 1.618)$",
            transform=ax.transAxes, fontsize=8.5)

    fig.tight_layout()
    out = FIG_DIR / "fig6_qs_regions_main.pdf"
    fig.savefig(out, bbox_inches="tight")
    plt.close(fig)
    print(f"-> {out}")


if __name__ == "__main__":
    plt.rcParams.update({
        "font.size": 10,
        "axes.labelsize": 10.5,
        "legend.fontsize": 8.5,
        "xtick.labelsize": 9,
        "ytick.labelsize": 9,
        "mathtext.fontset": "stix",
    })
    render_main_figure(v_h=1.3, v_l=1.0)
