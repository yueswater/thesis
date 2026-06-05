#!/usr/bin/env python3
"""Polished figure: Region III area vs V_H/V_L ratio, highlighting golden ratio threshold."""
from __future__ import annotations

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np

from paths import FIGURES_DIR as FIG_DIR


def s_star_l(q, v_h, v_l):
    if 2 * v_l <= v_h:
        return np.full_like(q, np.nan, dtype=float)
    numer = v_h**2 * (2 * v_l - v_h) - v_l**2 * (q * v_h + (1 - q) * v_l)
    denom = v_h * (2 * v_l - v_h) * (v_h - v_l)
    return numer / denom


def region_area(v_h, v_l, n=1201):
    """Area of Region III in (q,s) plane."""
    if 2 * v_l <= v_h:
        return 0.0
    q = np.linspace(0.0, 1.0, n)
    s = np.linspace(0.0, 1.0, n)
    Q, S = np.meshgrid(q, s)
    sL = s_star_l(Q, v_h, v_l)
    mask = (Q + S < 1.0) & np.isfinite(sL) & (S < sL) & (S >= 0)
    return mask.mean()


if __name__ == "__main__":
    plt.rcParams.update({
        "font.size": 10,
        "axes.labelsize": 10,
        "legend.fontsize": 9,
        "xtick.labelsize": 9,
        "ytick.labelsize": 9,
        "mathtext.fontset": "stix",
    })

    phi = (1 + np.sqrt(5)) / 2
    v_l = 1.0
    ratios = np.linspace(1.001, 2.2, 400)
    areas = np.array([region_area(r * v_l, v_l) for r in ratios])

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(13.5, 5.0),
                                    gridspec_kw={"width_ratios": [1.05, 1.0]})

    # === Left panel: Region III area vs V_H/V_L ===
    ax1.fill_between(ratios, 0, areas, color="#A0A0A0", alpha=0.55, zorder=2,
                     label=r"Region III area")
    ax1.plot(ratios, areas, color="black", linewidth=1.5, zorder=3)

    ax1.axvline(phi, color="black", linestyle="--", linewidth=1.0, zorder=2)
    ax1.text(phi + 0.02, 0.42,
             rf"$\varphi = \frac{{1+\sqrt{{5}}}}{{2}} \approx {phi:.4f}$",
             fontsize=11, va="top")
    ax1.annotate(
        "Region III disappears\nfor $V_H/V_L \\geq \\varphi$",
        xy=(phi, 0.005),
        xytext=(1.78, 0.18),
        fontsize=9,
        ha="left",
        arrowprops=dict(arrowstyle="->", lw=0.8, color="black"),
    )

    candidates = [
        (1.2, "1.2"), (1.3, "1.3"), (1.5, "1.5"),
        (1.7, "1.7"), (1.9, "1.9"),
    ]
    for r, label in candidates:
        a = region_area(r * v_l, v_l)
        ax1.plot(r, a, marker="o", color="black", markersize=6, zorder=5)
        if a > 0.005:
            ax1.annotate(rf"$V_H={label}$", xy=(r, a),
                         xytext=(r - 0.04, a + 0.025),
                         fontsize=8, ha="right")
        else:
            ax1.annotate(rf"$V_H={label}$", xy=(r, a),
                         xytext=(r + 0.02, 0.025),
                         fontsize=8, ha="left")

    ax1.plot(phi, 0, marker="o", color="black", markersize=6,
             zorder=6, markerfacecolor="white", markeredgewidth=1.2)

    ax1.set_xlabel(r"Type-gap ratio $\rho = V_H / V_L$")
    ax1.set_ylabel(r"Region III area in $(q,s) \in [0,1]^2$")
    ax1.set_xlim(1.0, 2.2)
    ax1.set_ylim(-0.01, 0.5)
    ax1.set_xticks([1.0, 1.2, 1.4, phi, 1.8, 2.0, 2.2])
    ax1.set_xticklabels(["1.0", "1.2", "1.4", r"$\varphi$", "1.8", "2.0", "2.2"])
    ax1.spines["top"].set_visible(False)
    ax1.spines["right"].set_visible(False)
    ax1.set_title(r"(a) Region III area as a function of $V_H/V_L$",
                  fontsize=11, pad=10)

    # === Right panel: f(rho) = rho^3 - 2 rho^2 + 1 ===
    rho_grid = np.linspace(0.9, 2.1, 400)
    f_vals = rho_grid**3 - 2 * rho_grid**2 + 1

    ax2.plot(rho_grid, f_vals, color="black", linewidth=1.4, zorder=3)
    ax2.axhline(0, color="black", linewidth=0.6, zorder=1)
    ax2.fill_between(rho_grid, 0, f_vals, where=(f_vals < 0),
                     color="#A0A0A0", alpha=0.55, zorder=2,
                     label=r"$f(\rho)<0$: Region III exists")
    ax2.fill_between(rho_grid, 0, f_vals, where=(f_vals > 0),
                     color="#E0E0E0", alpha=0.55, zorder=2,
                     label=r"$f(\rho)>0$: Region III empty")

    ax2.plot(1.0, 0, marker="o", color="black", markersize=6,
             markerfacecolor="white", markeredgewidth=1.2, zorder=5)
    ax2.plot(phi, 0, marker="o", color="black", markersize=7, zorder=5)
    ax2.annotate(r"$\rho = 1$ (degenerate)",
                 xy=(1.0, 0), xytext=(0.93, 0.25),
                 fontsize=9, ha="left",
                 arrowprops=dict(arrowstyle="->", lw=0.7, color="black"))
    ax2.annotate(rf"$\rho = \varphi \approx {phi:.4f}$",
                 xy=(phi, 0), xytext=(1.72, -0.45),
                 fontsize=10, ha="left",
                 arrowprops=dict(arrowstyle="->", lw=0.8, color="black"))

    ax2.set_xlabel(r"$\rho = V_H / V_L$")
    ax2.set_ylabel(r"$f(\rho) = \rho^{3} - 2\rho^{2} + 1$")
    ax2.set_xlim(0.9, 2.1)
    ax2.set_ylim(-0.55, 1.25)
    ax2.spines["top"].set_visible(False)
    ax2.spines["right"].set_visible(False)
    ax2.legend(loc="upper left", fontsize=8, frameon=True,
               facecolor="white", edgecolor="black", fancybox=False)
    ax2.set_title(r"(b) Cubic $f(\rho)$ and its roots",
                  fontsize=11, pad=10)

    fig.suptitle(
        r"Critical threshold for Region III: low-type bluffing exists iff $V_H/V_L < \varphi$",
        fontsize=12, y=1.02,
    )
    fig.tight_layout()
    out = FIG_DIR / "fig6_golden_ratio_threshold.pdf"
    fig.savefig(out, bbox_inches="tight")
    plt.close(fig)
    print(f"-> {out}")
