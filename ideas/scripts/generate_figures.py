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


# MODIFIED: added binary_lambda; updated e_ul_ss, e_um_ss to use corrected BNE formulas

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


def e_ul_ss(mu: float, delta: float, V: float) -> float:
    kappa = binary_kappa(mu, delta)
    nu = binary_nu(mu, delta)
    lam = binary_lambda(mu, delta)
    denom = 1.0 + V * lam
    return mu - 2.0 * V * kappa * nu / denom + (V * kappa) ** 2 / denom**2


def e_um_ss(mu: float, delta: float, V: float) -> float:
    kappa = binary_kappa(mu, delta)
    lam = binary_lambda(mu, delta)
    denom = 1.0 + V * lam
    return V**3 * kappa**2 * lam / denom**2


def e_ul_ml(mu: float, delta: float, V: float) -> float:
    kappa = binary_kappa(mu, delta)
    nu = binary_nu(mu, delta)
    return mu - V * kappa * nu + (V * kappa) ** 2 / 4.0


def e_um_ml(mu: float, delta: float, V: float) -> float:
    kappa = binary_kappa(mu, delta)
    return (V * kappa) ** 2 / 4.0


def e_ul_lm(mu: float, delta: float, V: float) -> float:
    return (mu * mu + delta * delta) / (4.0 * V)


def e_um_lm(mu: float, delta: float, V: float) -> float:
    two_v_minus_mu = 2.0 * V - mu
    return (two_v_minus_mu * two_v_minus_mu + delta * delta) / (4.0 * V)


# MODIFIED: updated to use corrected SS BNE payoff
def labor_ss_payoff(v: np.ndarray, mu: float, delta: float, V: float) -> np.ndarray:
    kappa = binary_kappa(mu, delta)
    lam = binary_lambda(mu, delta)
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
            b_l = e_ul_lm(mu, delta, V) - e_ul_ss(mu, delta, V)
            delta_m = e_um_ml(mu, delta, V) - e_um_lm(mu, delta, V)
            if b_l >= 0 and delta_m >= 0:
                grid[i, j] = 0
            elif b_l >= 0 and delta_m < 0:
                grid[i, j] = 1
            elif b_l < 0 and delta_m >= 0:
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
        Patch(facecolor="#d9f0a3", label=r"$\Delta_L^{\mathrm{LM}} \geq 0,\ \Delta_M \geq 0$"),
        Patch(facecolor="#addd8e", label=r"$\Delta_L^{\mathrm{LM}} \geq 0,\ \Delta_M < 0$"),
        Patch(facecolor="#78c679", label=r"$\Delta_L^{\mathrm{LM}} < 0,\ \Delta_M \geq 0$"),
        Patch(facecolor="#31a354", label=r"$\Delta_L^{\mathrm{LM}} < 0,\ \Delta_M < 0$"),
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


def plot_correlation_regions(
    VH: float = 2.0,
    VL: float = 1.0,
    show: bool = False,
) -> None:
    """Phase diagram for the partial-correlation extension (Chapter 6).

    Plots the critical boundary s*(q) in the (q,s) parameter space [0.5,1]^2
    that separates the separating-equilibrium region (below) from the
    pooling-equilibrium region (above). Grayscale only; no colour.
    """

    def s_boundary(q: np.ndarray) -> np.ndarray:
        num = VH**3 - VL * (2 * VH - VL) * (q * VH + (1 - q) * VL)
        den = VH**2 * (VH - VL)
        return num / den

    q_arr = np.linspace(0.5, 1.0, 500)
    s_arr = s_boundary(q_arr)

    fig, ax = plt.subplots(figsize=(5.0, 5.0))

    # ── Separating region (below boundary) ─────────────────────────────────
    # Polygon: bottom edge (0.5→1.0 at s=0.5), boundary reversed, close.
    q_sep = np.concatenate([np.linspace(0.5, 1.0, 200), q_arr[::-1]])
    s_sep = np.concatenate([np.full(200, 0.5), s_arr[::-1]])
    ax.fill(q_sep, s_sep, facecolor="0.88", edgecolor="none", zorder=1)
    ax.fill(q_sep, s_sep, facecolor="none", edgecolor="0.35",
            hatch="///", linewidth=0.0, zorder=2)

    # ── Pooling region (above boundary) ────────────────────────────────────
    # Polygon: boundary left→right, up right edge, top, close.
    q_pool = np.concatenate([q_arr, [1.0, 0.5, 0.5]])
    s_pool = np.concatenate([s_arr, [1.0, 1.0, s_arr[0]]])
    ax.fill(q_pool, s_pool, facecolor="0.55", edgecolor="none", zorder=1)
    ax.fill(q_pool, s_pool, facecolor="none", edgecolor="0.15",
            hatch="\\\\\\", linewidth=0.0, zorder=2)

    # ── Boundary line ───────────────────────────────────────────────────────
    ax.plot(q_arr, s_arr, "k-", linewidth=1.8, zorder=5,
            label=r"Critical boundary $s^{*}(q)$")

    # ── Special points ──────────────────────────────────────────────────────
    ax.plot(0.5, 0.5, "k^", markersize=7, zorder=6)
    ax.annotate(
        r"$(\frac{1}{2},\frac{1}{2})$: independent" "\n(benchmark)",
        xy=(0.5, 0.5), xytext=(0.515, 0.565), fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
        va="bottom",
    )

    ax.plot(1.0, 1.0, "ks", markersize=7, zorder=6)
    ax.annotate(
        "$(1,1)$: perfectly correlated\n(Fu 2006)",
        xy=(1.0, 1.0), xytext=(0.72, 0.96), fontsize=8,
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
        va="top",
    )

    # ── Region labels ───────────────────────────────────────────────────────
    ax.text(0.62, 0.55, "Separating\nequilibrium", ha="center", va="center",
            fontsize=8.5, style="italic", color="0.25")
    ax.text(0.78, 0.88, "Pooling\nequilibrium", ha="center", va="center",
            fontsize=8.5, style="italic", color="0.10")

    # ── Axes ────────────────────────────────────────────────────────────────
    ax.set_xlim(0.5, 1.0)
    ax.set_ylim(0.5, 1.0)
    ax.set_xlabel(r"$q = \Pr(v_M = V_H \mid v_L = V_H)$", fontsize=10)
    ax.set_ylabel(r"$s = \Pr(v_M = V_L \mid v_L = V_L)$", fontsize=10)
    ax.set_xticks([0.5, 0.6, 0.7, 0.8, 0.9, 1.0])
    ax.set_yticks([0.5, 0.6, 0.7, 0.8, 0.9, 1.0])
    ax.tick_params(direction="out", length=4, width=0.8)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.set_aspect("equal")

    from matplotlib.patches import Patch
    legend_elements = [
        Patch(facecolor="0.88", edgecolor="0.35", hatch="///",
              label="Separating equilibrium (benchmark)"),
        Patch(facecolor="0.55", edgecolor="0.15", hatch="\\\\\\",
              label="Pooling equilibrium (Fu 2006)"),
        plt.Line2D([0], [0], color="k", linewidth=1.8,
                   label=r"Critical boundary $s^{*}(q)$"),
    ]
    ax.legend(handles=legend_elements, loc="lower left", fontsize=7.5,
              framealpha=0.9, frameon=True)

    fig.tight_layout()
    if show:
        plt.show()
    else:
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
