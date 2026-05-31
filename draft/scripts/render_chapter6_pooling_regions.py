#!/usr/bin/env python3
"""Region figure for §6.4 (separating / coexistence / pooling).

One-dimensional spectrum of rho in [0, 1] split by rho_P and rho*.
Boundary annotations are staggered (rho_P below bar, rho* above bar)
to avoid label crowding when the two thresholds are close together.
"""

from __future__ import annotations

import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
os.environ.setdefault("MPLCONFIGDIR", str(ROOT / ".matplotlib"))

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt

FIG_DIR = ROOT / "figures"
FIG_DIR.mkdir(exist_ok=True)
(ROOT / ".matplotlib").mkdir(exist_ok=True)


def render_pooling_regions(
    V_H: float = 2.0,
    V_L: float = 1.0,
    q: float = 0.5,
) -> None:
    dV = V_H - V_L
    R = V_H**2 / (V_L * (2.0 * V_H - V_L))
    vhat_q = V_L + q * dV

    rho_star = (R - 1.0) * vhat_q / (dV * (1.0 - q + R * q))
    beta = (V_H - V_L) / (V_H + V_L)
    rho_P = beta**2 * vhat_q / ((1.0 - q) * dV * (1.0 - beta**2))
    rho_dstar = 1.0  # rho** = 1 for V_H = 2*V_L baseline

    fig, ax = plt.subplots(figsize=(6.4, 2.2))

    bar_y, bar_h = 0.0, 1.0
    segments = [
        (0.0,       rho_P,     "#F0F0F0", "I"),
        (rho_P,     rho_star,  "#D0D0D0", "C"),
        (rho_star,  rho_dstar, "#A0A0A0", "C'"),
    ]
    for x0, x1, color, label in segments:
        ax.add_patch(
            plt.Rectangle((x0, bar_y), x1 - x0, bar_h,
                          facecolor=color, edgecolor="black",
                          linewidth=0.7, zorder=1)
        )
        ax.text(0.5 * (x0 + x1), bar_y + 0.5 * bar_h, label,
                ha="center", va="center", fontsize=13, zorder=3,
                color=("white" if label == "C'" else "black"))

    # Vertical boundary lines
    for xb in (rho_P, rho_star):
        ax.plot([xb, xb], [bar_y, bar_y + bar_h],
                color="black", linewidth=1.0, zorder=2)

    # rho_P: annotate BELOW the bar
    ax.annotate(
        fr"$\rho_P \approx {rho_P:.3f}$",
        xy=(rho_P, bar_y),
        xytext=(rho_P - 0.09, bar_y - 0.48),
        ha="center", va="top", fontsize=9,
        arrowprops=dict(arrowstyle="->", lw=0.7, color="black",
                        connectionstyle="arc3,rad=0.0"),
    )

    # rho*: annotate ABOVE the bar
    ax.annotate(
        fr"$\rho^* \approx {rho_star:.3f}$",
        xy=(rho_star, bar_y + bar_h),
        xytext=(rho_star + 0.09, bar_y + bar_h + 0.48),
        ha="center", va="bottom", fontsize=9,
        arrowprops=dict(arrowstyle="->", lw=0.7, color="black",
                        connectionstyle="arc3,rad=0.0"),
    )

    # Endpoint labels
    ax.text(0.0, bar_y + bar_h + 0.12, "0\n(independent)",
            ha="center", va="bottom", fontsize=8.5)
    ax.text(1.0, bar_y + bar_h + 0.12, r"1 ($\rho^{**}$)" + "\n(fully correlated)",
            ha="center", va="bottom", fontsize=8.5)

    # Region labels (italic, above bar)
    ax.text(0.5 * rho_P, bar_y + bar_h + 0.12,
            "Separating only", ha="center", va="bottom",
            fontsize=8, style="italic")
    ax.text(0.5 * (rho_P + rho_star), bar_y + bar_h + 0.12,
            "Coexistence", ha="center", va="bottom",
            fontsize=8, style="italic")
    ax.text(0.5 * (rho_star + 1.0), bar_y + bar_h + 0.12,
            "Distorted sep + pooling", ha="center", va="bottom",
            fontsize=8, style="italic")

    ax.set_xlim(-0.03, 1.03)
    ax.set_ylim(-0.75, bar_h + 1.05)
    ax.set_yticks([])
    ax.set_xlabel(r"Correlation parameter $\rho$")
    ax.set_xticks([0.0, 1.0])
    ax.set_xticklabels(["0", "1"], fontsize=9)
    for s in ("top", "right", "left"):
        ax.spines[s].set_visible(False)
    ax.tick_params(direction="out", length=4, width=0.8)

    fig.tight_layout()
    fig.savefig(FIG_DIR / "fig6_pooling_regions.pdf", bbox_inches="tight")
    plt.close(fig)


def main() -> None:
    plt.rcParams.update({
        "font.family": "Times New Roman",
        "font.size": 10,
        "axes.labelsize": 10,
        "xtick.labelsize": 9,
        "ytick.labelsize": 9,
        "mathtext.fontset": "stix",
        "mathtext.rm": "Times New Roman",
        "mathtext.it": "Times New Roman:italic",
        "mathtext.bf": "Times New Roman:bold",
    })
    render_pooling_regions()


if __name__ == "__main__":
    main()
