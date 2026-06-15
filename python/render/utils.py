from __future__ import annotations

import numpy as np
import matplotlib.pyplot as plt


def style_axes(ax: plt.Axes, xlabel: str, ylabel: str) -> None:
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.tick_params(direction="out", length=4, width=0.8)


def add_axis_arrows(ax: plt.Axes) -> None:
    x0, x1 = ax.get_xlim()
    y0, y1 = ax.get_ylim()
    for sp in ax.spines.values():
        sp.set_visible(False)
    arrow = dict(arrowstyle="-|>", lw=0.5, color="black", mutation_scale=5, shrinkA=0, shrinkB=0)
    ax.annotate("", xy=(x1, y0), xytext=(x0, y0), arrowprops=arrow, annotation_clip=False)
    ax.annotate("", xy=(x0, y1), xytext=(x0, y0), arrowprops=arrow, annotation_clip=False)


def s_star_h(q: np.ndarray, v_h: float, v_l: float) -> np.ndarray:
    numer = v_h**3 - v_l * (2 * v_h - v_l) * (q * v_h + (1 - q) * v_l)
    denom = v_h**2 * (v_h - v_l)
    return numer / denom


def s_star_l(q: np.ndarray, v_h: float, v_l: float) -> np.ndarray:
    if 2 * v_l <= v_h:
        return np.full_like(q, np.nan, dtype=float)
    numer = v_h**2 * (2 * v_l - v_h) - v_l**2 * (q * v_h + (1 - q) * v_l)
    denom = v_h * (2 * v_l - v_h) * (v_h - v_l)
    return numer / denom
