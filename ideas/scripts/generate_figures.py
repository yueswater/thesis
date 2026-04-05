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


FIG_DIR = ROOT / "figures"
FIG_DIR.mkdir(exist_ok=True)
(ROOT / ".matplotlib").mkdir(exist_ok=True)

DPI = 600
V = 1.0


def binary_kappa(mu: float, delta: float) -> float:
    v_low = mu - delta
    v_high = mu + delta
    return 0.5 / math.sqrt(v_low) + 0.5 / math.sqrt(v_high)


def binary_nu(mu: float, delta: float) -> float:
    v_low = mu - delta
    v_high = mu + delta
    return 0.5 * (math.sqrt(v_low) + math.sqrt(v_high))


def e_ul_ss(mu: float, delta: float, V: float) -> float:
    kappa = binary_kappa(mu, delta)
    nu = binary_nu(mu, delta)
    return mu - V * kappa * nu + (V * V * kappa * kappa) / 4.0


def e_um_ss(mu: float, delta: float, V: float) -> float:
    kappa = binary_kappa(mu, delta)
    return (V * V * kappa * kappa) / 4.0


def e_ul_lm(mu: float, delta: float, V: float) -> float:
    return (mu * mu + delta * delta) / (4.0 * V)


def e_um_lm(mu: float, delta: float, V: float) -> float:
    return (4.0 * V * V - 4.0 * V * mu + mu * mu + delta * delta) / (4.0 * V)


def labor_ss_payoff(v: np.ndarray, mu: float, delta: float, V: float) -> np.ndarray:
    kappa = binary_kappa(mu, delta)
    return (np.sqrt(v) - V * kappa / 2.0) ** 2


def labor_lm_payoff(v: np.ndarray, V: float) -> np.ndarray:
    return v**2 / (4.0 * V)


def style_axes(ax: plt.Axes, xlabel: str, ylabel: str) -> None:
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.tick_params(direction="out", length=4, width=0.8)

    xticks = list(ax.get_xticks())
    yticks = list(ax.get_yticks())
    if 0.0 not in xticks:
        xticks.append(0.0)
    if 0.0 not in yticks:
        yticks.append(0.0)
    ax.set_xticks(sorted(set(round(x, 10) for x in xticks)))
    ax.set_yticks(sorted(set(round(y, 10) for y in yticks)))


def save_figure(fig: plt.Figure, filename: str) -> None:
    fig.savefig(FIG_DIR / filename, dpi=DPI, bbox_inches="tight")
    plt.close(fig)


def plot_timing_regions() -> None:
    mu_vals = np.linspace(0.2, 2.0, 361)
    delta_vals = np.linspace(0.0, 1.8, 321)
    grid = np.full((len(delta_vals), len(mu_vals)), np.nan)

    for i, delta in enumerate(delta_vals):
        for j, mu in enumerate(mu_vals):
            if delta >= mu:
                continue
            delta_l = e_ul_lm(mu, delta, V) - e_ul_ss(mu, delta, V)
            delta_m = e_um_ss(mu, delta, V) - e_um_lm(mu, delta, V)
            if delta_l >= 0 and delta_m >= 0:
                grid[i, j] = 0
            elif delta_l >= 0 and delta_m < 0:
                grid[i, j] = 1
            elif delta_l < 0 and delta_m >= 0:
                grid[i, j] = 2
            else:
                grid[i, j] = 3

    fig, ax = plt.subplots(figsize=(6.4, 4.8))
    cmap = ListedColormap(["#d9f0a3", "#addd8e", "#78c679", "#31a354"])
    mesh = ax.pcolormesh(mu_vals, delta_vals, grid, shading="nearest", cmap=cmap, vmin=0, vmax=3)
    mesh.set_edgecolor("face")
    ax.set_xlim(left=0.0, right=2.0)
    ax.set_ylim(bottom=0.0, top=1.8)
    style_axes(ax, r"Mean private value $\mu$", r"Dispersion $\delta$")

    legend_items = [
        Patch(facecolor="#d9f0a3", label=r"$\Delta_L \geq 0,\ \Delta_M \geq 0$"),
        Patch(facecolor="#addd8e", label=r"$\Delta_L \geq 0,\ \Delta_M < 0$"),
        Patch(facecolor="#78c679", label=r"$\Delta_L < 0,\ \Delta_M \geq 0$"),
        Patch(facecolor="#31a354", label=r"$\Delta_L < 0,\ \Delta_M < 0$"),
    ]
    ax.legend(handles=legend_items, frameon=False, fontsize=8, loc="upper right")
    ax.text(1.62, 1.62, r"$\delta=\mu$", fontsize=8, rotation=35, color="#444444")
    ax.plot([0, 2.0], [0, 2.0], linestyle="--", linewidth=0.9, color="#666666")
    save_figure(fig, "binary_timing_regions.png")


def plot_labor_payoffs() -> None:
    mu = 1.2
    delta = 0.4
    v = np.linspace(0.0, 2.0, 600)

    ss = labor_ss_payoff(v, mu, delta, V)
    lm = labor_lm_payoff(v, V)

    fig, ax = plt.subplots(figsize=(6.4, 4.8))
    ax.plot(v, ss, linewidth=1.6, color="#1f77b4", label="SS payoff")
    ax.plot(v, lm, linewidth=1.6, color="#d62728", label="LM payoff")
    ax.set_xlim(left=0.0, right=2.0)
    ax.set_ylim(bottom=0.0)
    style_axes(ax, r"Labor type $v$", "Expected payoff")
    ax.legend(frameon=False, loc="upper left")
    ax.axvline(mu - delta, color="#888888", linestyle="--", linewidth=0.8)
    ax.axvline(mu + delta, color="#888888", linestyle="--", linewidth=0.8)
    ax.text(mu - delta + 0.02, ax.get_ylim()[1] * 0.92, r"$V_\ell$", fontsize=8, color="#555555")
    ax.text(mu + delta + 0.02, ax.get_ylim()[1] * 0.92, r"$V_H$", fontsize=8, color="#555555")
    save_figure(fig, "labor_payoff_comparison.png")


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


if __name__ == "__main__":
    main()
