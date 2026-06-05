#!/usr/bin/env python3
"""Continuous-spectrum figure for §6.3.

Plots the effective-prize ratio hat_V_U(1) / hat_V_U(0) as a function of the
single correlation parameter rho in [0, 1].

At rho = 0 the ratio equals 1 (separation holds strictly); at rho = 1 the ratio
reaches V_H / V_L > R and separation fails.  A dotted vertical line at rho*
marks the unique crossing where the ratio equals R.
"""

from __future__ import annotations

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np

from paths import FIGURES_DIR as FIG_DIR


def render_spectrum(
    V_H: float = 2.0,
    V_L: float = 1.0,
    q: float = 0.5,
) -> None:
    dV = V_H - V_L
    rho = np.linspace(0.0, 1.0, 600)

    vhat1 = V_L + (q + rho * (1.0 - q)) * dV   # hat_V_U(1)
    vhat0 = V_L + q * (1.0 - rho) * dV         # hat_V_U(0)
    ratio = vhat1 / vhat0

    R = V_H**2 / (V_L * (2.0 * V_H - V_L))
    vhat_q = V_L + q * dV
    rho_star = (R - 1.0) * vhat_q / (dV * (1.0 - q + R * q))

    fig, ax = plt.subplots(figsize=(6.0, 3.6))

    # Shaded regions
    ax.axvspan(0.0, rho_star, alpha=0.10, color="black", zorder=0)
    ax.axvspan(rho_star, 1.0, alpha=0.25, color="black", zorder=0)

    # Ratio curve
    ax.plot(rho, ratio, color="black", linewidth=1.5, zorder=3)

    # Threshold line R
    ax.axhline(R, color="black", linewidth=0.9, linestyle="--", zorder=2)
    ax.text(
        0.02, R + 0.025,
        r"$R = V_H^2\!/[V_L(2V_H\!-\!V_L)]$",
        fontsize=8.5, va="bottom",
    )

    # Crossing marker
    ax.axvline(rho_star, color="black", linewidth=0.8, linestyle=":", zorder=2)
    ax.plot(rho_star, R, marker="o", color="black", markersize=4.5, zorder=5)

    # Region labels
    y_mid = 0.5 * (ratio.min() + R)
    ax.text(rho_star / 2.0, y_mid, "Separating", ha="center", fontsize=9, style="italic")
    ax.text((rho_star + 1.0) / 2.0, y_mid, "Pooling", ha="center", fontsize=9, style="italic")

    # Endpoint markers
    ax.plot(0.0, ratio[0], marker="o", color="black", markersize=5, zorder=4)
    ax.plot(1.0, ratio[-1], marker="s", color="black", markersize=5, zorder=4)

    ax.set_xticks([0.0, rho_star, 1.0])
    ax.set_xticklabels(
        [r"$0$" + "\n(independent)", fr"$\rho^*\!\approx\!{rho_star:.2f}$", r"$1$" + "\n(fully correlated)"],
        fontsize=8.5,
    )
    ax.set_ylabel(r"$\hat{V}_U(1)\,/\,\hat{V}_U(0)$")
    ax.set_xlabel(r"Correlation parameter $\rho$")

    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.tick_params(direction="out", length=4, width=0.8)
    ax.set_xlim(-0.02, 1.02)
    ax.set_ylim(ratio.min() - 0.08, ratio.max() + 0.18)

    fig.tight_layout()
    fig.savefig(FIG_DIR / "fig6_spectrum.pdf", bbox_inches="tight")
    plt.close(fig)


def main() -> None:
    plt.rcParams.update(
        {
            "font.family": "Times New Roman",
            "font.size": 10,
            "axes.labelsize": 10,
            "xtick.labelsize": 9,
            "ytick.labelsize": 9,
            "mathtext.fontset": "stix",
            "mathtext.rm": "Times New Roman",
            "mathtext.it": "Times New Roman:italic",
            "mathtext.bf": "Times New Roman:bold",
        }
    )
    render_spectrum()


if __name__ == "__main__":
    main()
