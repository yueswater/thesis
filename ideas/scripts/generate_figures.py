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
from matplotlib.lines import Line2D
from matplotlib.patches import Patch


FIG_DIR = ROOT / "figures"
FIG_DIR.mkdir(exist_ok=True)
(ROOT / ".matplotlib").mkdir(exist_ok=True)

DPI = 600
V = 1.0


def binary_support_from_mean(mu: float, delta: float, q: float) -> tuple[float, float]:
    """Construct a binary support with mean mu and gap 2*delta."""
    v_low = mu - 2.0 * q * delta
    v_high = mu + 2.0 * (1.0 - q) * delta
    return v_low, v_high


def binary_mean(v_low: float, v_high: float, q: float = 0.5) -> float:
    return (1.0 - q) * v_low + q * v_high


def binary_variance(v_low: float, v_high: float, q: float = 0.5) -> float:
    return q * (1.0 - q) * (v_high - v_low) ** 2


def binary_kappa(v_low: float, v_high: float, q: float = 0.5) -> float:
    return (1.0 - q) / math.sqrt(v_low) + q / math.sqrt(v_high)


def binary_nu(v_low: float, v_high: float, q: float = 0.5) -> float:
    return (1.0 - q) * math.sqrt(v_low) + q * math.sqrt(v_high)


def binary_lambda(v_low: float, v_high: float, q: float = 0.5) -> float:
    return (1.0 - q) / v_low + q / v_high


def e_ul_ss_binary(v_low: float, v_high: float, q: float, V: float) -> float:
    mu = binary_mean(v_low, v_high, q)
    kappa = binary_kappa(v_low, v_high, q)
    nu = binary_nu(v_low, v_high, q)
    lam = binary_lambda(v_low, v_high, q)
    denom = 1.0 + V * lam
    return mu - 2.0 * V * kappa * nu / denom + (V * kappa) ** 2 / denom**2


def e_ul_ml_binary(v_low: float, v_high: float, q: float, V: float) -> float:
    mu = binary_mean(v_low, v_high, q)
    kappa = binary_kappa(v_low, v_high, q)
    nu = binary_nu(v_low, v_high, q)
    return mu - V * kappa * nu + (V * kappa) ** 2 / 4.0


def e_um_ml_binary(v_low: float, v_high: float, q: float, V: float) -> float:
    kappa = binary_kappa(v_low, v_high, q)
    return (V * kappa) ** 2 / 4.0


def e_ul_lm_binary(v_low: float, v_high: float, q: float, V: float) -> float:
    ev2 = (1.0 - q) * v_low * v_low + q * v_high * v_high
    return ev2 / (4.0 * V)


def e_um_lm_binary(v_low: float, v_high: float, q: float, V: float) -> float:
    mu = binary_mean(v_low, v_high, q)
    sigma2 = binary_variance(v_low, v_high, q)
    return (4.0 * V * V - 4.0 * V * mu + mu * mu + sigma2) / (4.0 * V)


def labor_ss_payoff(v: np.ndarray, v_low: float, v_high: float, q: float, V: float) -> np.ndarray:
    kappa = binary_kappa(v_low, v_high, q)
    lam = binary_lambda(v_low, v_high, q)
    c = V * kappa / (1.0 + V * lam)
    return (np.sqrt(v) - c) ** 2


def labor_lm_payoff(v: np.ndarray, V: float) -> np.ndarray:
    return v**2 / (4.0 * V)


def style_axes(ax: plt.Axes, xlabel: str, ylabel: str) -> None:
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.tick_params(direction="out", length=4, width=0.8)


def save_figure(fig: plt.Figure, filename: str) -> None:
    fig.savefig(FIG_DIR / filename, dpi=DPI, bbox_inches="tight")
    plt.close(fig)


def plot_timing_regions(q_values: tuple[float, ...] = (0.3, 0.5, 0.7)) -> None:
    mu_vals = np.linspace(0.25, 2.0, 281)
    delta_vals = np.linspace(0.0, 1.2, 221)
    cmap = ListedColormap(["#d9f0a3", "#addd8e", "#78c679", "#31a354"])

    fig, axes = plt.subplots(1, len(q_values), figsize=(4.6 * len(q_values), 4.2), sharey=True)
    if len(q_values) == 1:
        axes = [axes]

    for ax, q in zip(axes, q_values):
        grid = np.full((len(delta_vals), len(mu_vals)), np.nan)
        for i, delta in enumerate(delta_vals):
            for j, mu in enumerate(mu_vals):
                v_low, v_high = binary_support_from_mean(mu, delta, q)
                if v_low <= 0.0 or v_high <= v_low:
                    continue
                delta_l = e_ul_lm_binary(v_low, v_high, q, V) - e_ul_ss_binary(v_low, v_high, q, V)
                delta_m = e_um_ml_binary(v_low, v_high, q, V) - e_um_lm_binary(v_low, v_high, q, V)
                if delta_l >= 0 and delta_m >= 0:
                    grid[i, j] = 0
                elif delta_l >= 0 and delta_m < 0:
                    grid[i, j] = 1
                elif delta_l < 0 and delta_m >= 0:
                    grid[i, j] = 2
                else:
                    grid[i, j] = 3

        mesh = ax.pcolormesh(mu_vals, delta_vals, grid, shading="nearest", cmap=cmap, vmin=0, vmax=3)
        mesh.set_edgecolor("face")
        style_axes(ax, r"Mean private value $\mu$", r"Dispersion parameter $\delta$")
        ax.set_title(fr"$q={q:.1f}$")
        ax.set_xlim(0.25, 2.0)
        ax.set_ylim(0.0, 1.2)
        boundary = mu_vals / (2.0 * q)
        ax.plot(mu_vals, np.minimum(boundary, delta_vals[-1]), linestyle="--", linewidth=0.9, color="#666666")

    legend_items = [
        Patch(facecolor="#d9f0a3", label=r"$\Delta_L^{\mathrm{LM}} \geq 0,\ \Delta_M \geq 0$"),
        Patch(facecolor="#addd8e", label=r"$\Delta_L^{\mathrm{LM}} \geq 0,\ \Delta_M < 0$"),
        Patch(facecolor="#78c679", label=r"$\Delta_L^{\mathrm{LM}} < 0,\ \Delta_M \geq 0$"),
        Patch(facecolor="#31a354", label=r"$\Delta_L^{\mathrm{LM}} < 0,\ \Delta_M < 0$"),
    ]
    fig.legend(handles=legend_items, frameon=False, fontsize=8, loc="upper center", ncol=2)
    fig.tight_layout(rect=(0.0, 0.0, 1.0, 0.92))
    save_figure(fig, "binary_timing_regions.png")


def plot_labor_payoffs(q_values: tuple[float, ...] = (0.3, 0.5, 0.7)) -> None:
    v_low = 0.8
    v_high = 1.6
    v = np.linspace(0.05, 2.0, 800)

    fig, ax = plt.subplots(figsize=(6.6, 4.8))
    ss_colors = ["#1b9e77", "#377eb8", "#d95f02"]
    for color, q in zip(ss_colors, q_values):
        ss = labor_ss_payoff(v, v_low, v_high, q, V)
        ax.plot(v, ss, linewidth=1.6, color=color, label=fr"SS payoff ($q={q:.1f}$)")

    lm = labor_lm_payoff(v, V)
    ax.plot(v, lm, linewidth=1.8, color="#222222", linestyle="--", label="LM payoff")
    ax.axvline(v_low, color="#888888", linestyle=":", linewidth=0.9)
    ax.axvline(v_high, color="#888888", linestyle=":", linewidth=0.9)
    ax.text(v_low + 0.02, 0.93 * ax.get_ylim()[1] if ax.get_ylim()[1] else 0.2, r"$V_\ell$", fontsize=8, color="#555555")
    ax.text(v_high + 0.02, 0.93 * ax.get_ylim()[1] if ax.get_ylim()[1] else 0.2, r"$V_H$", fontsize=8, color="#555555")
    style_axes(ax, r"Labor type $v$", "Expected payoff")
    ax.set_xlim(0.0, 2.0)
    ax.set_ylim(bottom=0.0)
    ax.legend(frameon=False, loc="upper left")
    save_figure(fig, "labor_payoff_comparison.png")


def plot_correlation_regions(VH: float = 2.0, VL: float = 1.0, q_values: tuple[float, ...] = (0.3, 0.5, 0.7)) -> None:
    delta = VH - VL
    R = VH**2 / (VL * (2.0 * VH - VL))

    def boundary(p_h: np.ndarray) -> np.ndarray:
        return (R * VH - VL - p_h * delta) / (R * delta)

    p_h_vals = np.linspace(0.0, 1.0, 401)
    p_l_vals = np.linspace(0.0, 1.0, 401)
    grid_h, grid_l = np.meshgrid(p_h_vals, p_l_vals)
    boundary_grid = boundary(grid_h)
    region = np.where(grid_l <= boundary_grid, 0, 1)

    fig, ax = plt.subplots(figsize=(5.4, 5.2))
    cmap = ListedColormap(["#e5e5e5", "#8c8c8c"])
    mesh = ax.pcolormesh(p_h_vals, p_l_vals, region, shading="nearest", cmap=cmap, vmin=0, vmax=1)
    mesh.set_edgecolor("face")

    boundary_vals = boundary(p_h_vals)
    valid = (boundary_vals >= 0.0) & (boundary_vals <= 1.0)
    ax.plot(p_h_vals[valid], boundary_vals[valid], color="black", linewidth=1.8, label=r"Critical boundary $p_\ell^*(p_H)$")

    line_colors = ["#1b9e77", "#377eb8", "#d95f02"]
    for color, q in zip(line_colors, q_values):
        p_h_line = np.linspace(q, 1.0, 200)
        p_l_line = 1.0 - q * (1.0 - p_h_line) / (1.0 - q)
        ax.plot(p_h_line, p_l_line, linestyle="--", linewidth=1.0, color=color)
        ax.plot(q, 1.0 - q, marker="o", markersize=4.5, color=color)
        ax.annotate(
            fr"independent $(q,1-q)$, $q={q:.1f}$",
            xy=(q, 1.0 - q),
            xytext=(q + 0.03, 1.0 - q + 0.05),
            fontsize=7.5,
            color=color,
            arrowprops=dict(arrowstyle="->", lw=0.7, color=color),
        )

    ax.plot(1.0, 1.0, marker="s", markersize=6.5, color="black")
    ax.annotate(
        "#c("fu2006")\n$(1,1)$",
        xy=(1.0, 1.0),
        xytext=(0.78, 0.9),
        fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
    )

    ax.text(0.18, 0.28, "Separating region", fontsize=8.5, color="#333333")
    ax.text(0.62, 0.82, "Pooling region", fontsize=8.5, color="#111111")

    style_axes(ax, r"$p_H = \Pr(V_M=V_H \mid V_L=V_H)$", r"$p_\ell = \Pr(V_M=V_\ell \mid V_L=V_\ell)$")
    ax.set_xlim(0.0, 1.0)
    ax.set_ylim(0.0, 1.0)
    ax.set_aspect("equal")

    legend_items = [
        Patch(facecolor="#e5e5e5", edgecolor="none", label="Separating equilibrium"),
        Patch(facecolor="#8c8c8c", edgecolor="none", label="Pooling equilibrium"),
        Line2D([0], [0], color="black", linewidth=1.8, label=r"Critical boundary $p_\ell^*(p_H)$"),
        Line2D([0], [0], color="#555555", linestyle="--", linewidth=1.0, label="Representative consistency paths"),
    ]
    ax.legend(handles=legend_items, loc="lower left", fontsize=7.5, frameon=False)
    fig.tight_layout()
    save_figure(fig, "partial_correlation_regions.png")


def main() -> None:
    plt.rcParams.update(
        {
            "font.size": 10,
            "axes.labelsize": 10,
            "axes.titlesize": 10,
            "legend.fontsize": 8,
            "xtick.labelsize": 9,
            "ytick.labelsize": 9,
        }
    )
    plot_timing_regions()
    plot_labor_payoffs()
    plot_correlation_regions()


if __name__ == "__main__":
    main()
