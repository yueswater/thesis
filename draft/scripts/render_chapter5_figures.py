#!/usr/bin/env python3
from __future__ import annotations

import math
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
os.environ.setdefault("MPLCONFIGDIR", str(ROOT / ".matplotlib"))

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import ListedColormap
from matplotlib.patches import Patch
from matplotlib.ticker import FuncFormatter


FIG_DIR = ROOT / "figures"
FIG_DIR.mkdir(exist_ok=True)
(ROOT / ".matplotlib").mkdir(exist_ok=True)

V = 1.0


def binary_kappa(mu: float, delta: float) -> float:
    v_low = mu - delta
    v_high = mu + delta
    return 0.5 / math.sqrt(v_low) + 0.5 / math.sqrt(v_high)


def binary_nu(mu: float, delta: float) -> float:
    v_low = mu - delta
    v_high = mu + delta
    return 0.5 * (math.sqrt(v_low) + math.sqrt(v_high))


def binary_lambda(mu: float, delta: float) -> float:
    v_low = mu - delta
    v_high = mu + delta
    return 0.5 / v_low + 0.5 / v_high


def e_i_ss(mu: float, delta: float, v: float) -> float:
    kappa = binary_kappa(mu, delta)
    lam = binary_lambda(mu, delta)
    c = V * kappa / (1.0 + V * lam)
    return (math.sqrt(v) - c) ** 2


def e_i_ss_ex_ante(mu: float, delta: float) -> float:
    kappa = binary_kappa(mu, delta)
    nu = binary_nu(mu, delta)
    lam = binary_lambda(mu, delta)
    denom = 1.0 + V * lam
    return mu - 2.0 * V * kappa * nu / denom + (V * kappa) ** 2 / denom**2


def e_u_ui(mu: float, delta: float) -> float:
    kappa = binary_kappa(mu, delta)
    return (V * kappa) ** 2 / 4.0


def e_u_iu(mu: float, delta: float) -> float:
    return ((2.0 * V - mu) ** 2 + delta**2) / (4.0 * V)


def e_i_iu(v: np.ndarray) -> np.ndarray:
    return v**2 / (4.0 * V)


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


def int_tick(x: float, _: object) -> str:
    if abs(x - round(x)) < 1e-8:
        return str(int(round(x)))
    return ""


def half_tick(x: float, _: object) -> str:
    # integers or values ending in .5
    if abs(x - round(x)) < 1e-8:
        return str(int(round(x)))
    if abs((x * 2) - round(x * 2)) < 1e-8:
        return f"{x:.1f}"
    return ""


def plot_timing_regions_pdf() -> None:
    mu_vals = np.linspace(0.2, 2.0, 361)
    delta_vals = np.linspace(0.0, 1.8, 321)
    grid = np.full((len(delta_vals), len(mu_vals)), np.nan)

    for i, delta in enumerate(delta_vals):
        for j, mu in enumerate(mu_vals):
            if delta >= mu:
                continue
            delta_i_iu = (mu * mu + delta * delta) / (4.0 * V) - e_i_ss_ex_ante(mu, delta)
            delta_u = e_u_ui(mu, delta) - e_u_iu(mu, delta)
            if delta_i_iu >= 0 and delta_u >= 0:
                grid[i, j] = 0
            elif delta_i_iu >= 0 and delta_u < 0:
                grid[i, j] = 1
            elif delta_i_iu < 0 and delta_u >= 0:
                grid[i, j] = 2
            else:
                grid[i, j] = 3

    fig, ax = plt.subplots(figsize=(6.4, 4.8))
    cmap = ListedColormap(["#f2f2f2", "#d9d9d9", "#bdbdbd", "#969696"])
    mesh = ax.pcolormesh(mu_vals, delta_vals, grid, shading="nearest", cmap=cmap, vmin=0, vmax=3)
    mesh.set_edgecolor("face")
    ax.plot([0, 2.0], [0, 2.0], linestyle="--", linewidth=1.0, color="black")
    ax.text(1.60, 1.52, r"$\delta=\mu$", fontsize=9, rotation=28, color="black")

    ax.set_xlim(left=0.0, right=2.0)
    ax.set_ylim(bottom=0.0, top=2.0)
    ax.set_xticks([1.0, 2.0])
    ax.set_yticks([1.0, 2.0])
    style_axes(ax, r"$\mu$", r"$\delta$")
    ax.xaxis.set_major_formatter(FuncFormatter(int_tick))
    ax.yaxis.set_major_formatter(FuncFormatter(int_tick))
    add_axis_arrows(ax)

    legend_items = [
        Patch(facecolor="#f2f2f2", edgecolor="black", label=r"$\Delta_I^{IU}\geq0,\ \Delta_U\geq0$"),
        Patch(facecolor="#d9d9d9", edgecolor="black", label=r"$\Delta_I^{IU}\geq0,\ \Delta_U<0$"),
        Patch(facecolor="#bdbdbd", edgecolor="black", label=r"$\Delta_I^{IU}<0,\ \Delta_U\geq0$"),
        Patch(facecolor="#969696", edgecolor="black", label=r"$\Delta_I^{IU}<0,\ \Delta_U<0$"),
    ]
    ax.legend(
        handles=legend_items,
        frameon=True,
        facecolor="white",
        edgecolor="black",
        fancybox=False,
        fontsize=8,
        loc="center left",
        bbox_to_anchor=(1.02, 0.5),
        borderaxespad=0.0,
    )

    ax.text(
        0.06,
        0.95,
        r"Binary case, $V=1$",
        transform=ax.transAxes,
        ha="left",
        va="top",
        fontsize=9,
    )

    fig.tight_layout()
    fig.savefig(FIG_DIR / "fig5_regions.pdf", bbox_inches="tight")
    plt.close(fig)


def plot_i_payoff_comparison_pdf() -> None:
    mu = 1.2
    delta = 0.8
    v_low = mu - delta
    v_high = mu + delta
    v = np.linspace(v_low, v_high, 600)

    ss = np.array([e_i_ss(mu, delta, x) for x in v])
    iu = e_i_iu(v)

    # Crossover v* where SS and IU payoffs are equal.
    diff = ss - iu
    cross_idx = np.where(np.diff(np.sign(diff)) != 0)[0]
    v_star: float | None = None
    y_star: float | None = None
    if len(cross_idx) > 0:
        k = int(cross_idx[0])
        x0, x1 = v[k], v[k + 1]
        d0, d1 = diff[k], diff[k + 1]
        v_star = float(x0 - d0 * (x1 - x0) / (d1 - d0))
        y_star = float(np.interp(v_star, v, ss))

    y_peak = max(float(np.max(ss)), float(np.max(iu)))
    y_lo = 0.0
    y_hi = y_peak * 1.22

    fig, ax = plt.subplots(figsize=(6.4, 4.4))

    # Background bands flag the preferred-regime v-interval.
    if v_star is not None:
        ax.axvspan(v_low, v_star, color="#e7e7e7", zorder=0)
        ax.axvspan(v_star, v_high, color="#f7f7f7", zorder=0)

    # Payoff gap between regimes (darker = SS ahead, lighter = IU ahead).
    ax.fill_between(v, ss, iu, where=(ss >= iu), color="0.55",
                    alpha=0.35, interpolate=True, zorder=1)
    ax.fill_between(v, ss, iu, where=(ss < iu), color="0.75",
                    alpha=0.30, interpolate=True, zorder=1)

    # Payoff curves.
    ax.plot(v, ss, linewidth=2.0, color="black", linestyle="-",
            label=r"$\pi_I^{SS}(v)$", zorder=3)
    ax.plot(v, iu, linewidth=2.0, color="black", linestyle=(0, (5, 2.5)),
            label=r"$\pi_I^{IU}(v)$", zorder=3)

    # Crossover highlight.
    if v_star is not None and y_star is not None:
        ax.axvline(v_star, color="black", linestyle=(0, (1, 2.5)),
                   linewidth=1.0, zorder=2)
        ax.plot([v_star], [y_star], marker="o", markersize=5.5,
                color="black", markeredgecolor="black", zorder=4)

    # Support boundaries.
    ax.axvline(v_low, color="black", linestyle=":", linewidth=0.8, zorder=2)
    ax.axvline(v_high, color="black", linestyle=":", linewidth=0.8, zorder=2)

    ax.set_xlim(left=v_low, right=v_high)
    ax.set_ylim(bottom=y_lo, top=y_hi)
    ax.set_xticks([0.5, 1.0, 1.5, 2.0])
    ax.xaxis.set_major_formatter(FuncFormatter(half_tick))
    ax.set_yticks([0.0, 0.25, 0.5, 0.75, 1.0])
    ax.yaxis.set_major_formatter(
        FuncFormatter(lambda y, _: "0" if abs(y) < 1e-8 else f"{y:.2f}")
    )
    style_axes(ax, r"$v$", "Payoff")

    # Boundary and crossover annotations sit above the plot area.
    above_y = y_hi * 1.01
    ax.text(v_low, above_y, r"$v_L$", fontsize=9, ha="center", va="bottom")
    ax.text(v_high, above_y, r"$v_H$", fontsize=9, ha="center", va="bottom")
    if v_star is not None:
        ax.text(v_star, above_y, r"$v^{*}$", fontsize=9,
                ha="center", va="bottom")

    # Region tags. SS-preferred band is narrow — point to it from outside.
    if v_star is not None:
        ax.annotate(
            r"$SS\succ IU$",
            xy=((v_low + v_star) / 2.0, y_hi * 0.32),
            xytext=(v_star + 0.18, y_hi * 0.60),
            fontsize=9.5,
            ha="left", va="center",
            arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
            bbox=dict(facecolor="white", edgecolor="0.35",
                      linewidth=0.6, boxstyle="square,pad=0.3"),
        )
        ax.text(
            (v_star + v_high) / 2.0,
            y_hi * 0.87,
            r"$IU\succ SS$",
            fontsize=9.5,
            ha="center",
            va="center",
            bbox=dict(facecolor="white", edgecolor="0.35",
                      linewidth=0.6, boxstyle="square,pad=0.3"),
        )

    ax.legend(frameon=True, facecolor="white", edgecolor="black",
              fancybox=False, loc="upper left", borderaxespad=0.8)

    ax.text(
        0.985, 0.02,
        rf"$(\mu,\delta,V)=({mu:.1f},{delta:.1f},{V:.0f})$",
        transform=ax.transAxes, ha="right", va="bottom", fontsize=9,
        bbox=dict(facecolor="white", edgecolor="0.35",
                  linewidth=0.6, boxstyle="square,pad=0.3"),
    )

    add_axis_arrows(ax)

    fig.subplots_adjust(left=0.10, right=0.98, bottom=0.13, top=0.93)
    fig.savefig(FIG_DIR / "fig5_payoffs.pdf", bbox_inches="tight")
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
    plot_timing_regions_pdf()
    plot_i_payoff_comparison_pdf()


if __name__ == "__main__":
    main()
