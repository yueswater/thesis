"""
Where does the IU-subgame pooling continuum sit relative to the endogenous-
timing thresholds, as a function of q?  (main model, v_L = 1, v_h = 2)

Curves over q in (0,1):
  rho_dagger(q) : informed's IU-vs-SS indifference (separating continuation).
                  IU is a stage-0 equilibrium (separating selection) iff rho <= rho_dagger.
  rho_P(q)      : pooling threshold; a continuum of pooling equilibria exists iff rho >= rho_P.
  rho_star(q)   : undistorted-separating breaks at rho_star (Riley above it).

Key diagnostic: the band  rho_P <= rho <= rho_dagger  (only when rho_P < rho_dagger,
i.e. small q) is where a pooling continuation INVADES the region in which clause (1)
of the timing theorem claims "IU is the unique equilibrium". There the separating
selection is load-bearing. For q above the crossover, rho_P > rho_dagger and the
IU region is clean (pooling only touches the upper SS / no-PSNE zone, as in Fu 2006).
"""

from __future__ import annotations

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np

from style import apply as apply_style

VL, VH = 1.0, 2.0
DV = VH - VL


def vbar(q):
    return VL + DV * q


def Vu(one: bool, rho, q):
    thH = q + rho * (1 - q)
    thL = q * (1 - rho)
    return VL + DV * (thH if one else thL)


def piI_SS(rho, q):
    VHh, VL0 = Vu(True, rho, q), Vu(False, rho, q)
    A = q * VHh / np.sqrt(VH) + (1 - q) * VL0 / np.sqrt(VL)
    B = q * VHh / VH + (1 - q) * VL0 / VL
    c = A / (1 + B)
    return q * (np.sqrt(VH) - c) ** 2 + (1 - q) * (np.sqrt(VL) - c) ** 2


def piI_IU_sep(rho, q):
    VHh, VL0 = Vu(True, rho, q), Vu(False, rho, q)
    return q * VH ** 2 / (4 * VHh) + (1 - q) * VL ** 2 / (4 * VL0)


def D_I_IU(rho, q):
    return piI_IU_sep(rho, q) - piI_SS(rho, q)


def rho_dagger(q):
    """Root of D_I_IU over rho in (0,1); None if informed never prefers IU."""
    if D_I_IU(1e-6, q) <= 0:
        return np.nan
    lo, hi = 1e-6, 1.0 - 1e-9
    if D_I_IU(hi, q) > 0:  # still positive at rho=1 -> no crossing below 1
        return np.nan
    for _ in range(200):
        mid = 0.5 * (lo + hi)
        if D_I_IU(lo, q) * D_I_IU(mid, q) <= 0:
            hi = mid
        else:
            lo = mid
    return 0.5 * (lo + hi)


def rho_P(q):
    return vbar(q) * DV / (4 * VH * VL * (1 - q))


def rho_star(q):
    R = VH ** 2 / (VL * (2 * VH - VL))
    return (R - 1) / (1 + q * (R - 1)) * vbar(q) / DV


def main():
    apply_style()
    qs = np.linspace(0.01, 0.95, 600)
    rd = np.array([rho_dagger(q) for q in qs])
    rp = np.array([rho_P(q) for q in qs])
    rs = np.array([rho_star(q) for q in qs])

    rd_plot = np.where(np.isnan(rd), 0.0, rd)  # no IU region -> rho_dagger = 0

    # crossover q where rho_P == rho_dagger
    diff = rp - rd_plot
    qc = None
    for i in range(1, len(qs)):
        if not np.isnan(rd[i]) and not np.isnan(rd[i - 1]) and diff[i - 1] * diff[i] < 0:
            qc = qs[i - 1] - diff[i - 1] * (qs[i] - qs[i - 1]) / (diff[i] - diff[i - 1])
            break

    fig, ax = plt.subplots(figsize=(7.2, 5.0))

    # IU-equilibrium region: rho <= rho_dagger
    ax.fill_between(qs, 0, rd_plot, color="#92c5de", alpha=0.55,
                    label=r"IU eq. region  ($\rho \leq \rho^\dagger$)")
    # pooling exists: rho >= rho_P  (cap at 1)
    ax.fill_between(qs, rp, 1.0, where=(rp <= 1.0), color="#f4a582", alpha=0.40,
                    label=r"pooling exists  ($\rho \geq \rho_P$)")
    # INVASION band: rho_P <= rho <= rho_dagger (only where rho_P < rho_dagger)
    inv_top = np.minimum(rd_plot, 1.0)
    inv_bot = rp
    mask = inv_bot < inv_top
    ax.fill_between(qs, inv_bot, inv_top, where=mask, facecolor="none",
                    hatch="xxx", edgecolor="#b2182b", linewidth=0.0,
                    label="pooling invades IU region")

    ax.plot(qs, rd_plot, color="#2166ac", lw=1.8, label=r"$\rho^\dagger(q)$")
    ax.plot(qs, np.where(rp <= 1.0, rp, np.nan), color="#b2182b", lw=1.8,
            label=r"$\rho_P(q)$")
    ax.plot(qs, rs, color="#444444", lw=1.2, ls="--", label=r"$\rho^*(q)$")

    if qc is not None:
        yc = rho_P(qc)
        ax.plot([qc], [yc], "o", color="black", ms=5, zorder=5)
        ax.annotate(rf"$\rho_P=\rho^\dagger$  at  $q\approx{qc:.3f}$",
                    xy=(qc, yc), xytext=(qc + 0.04, yc + 0.16),
                    fontsize=9,
                    arrowprops=dict(arrowstyle="->", lw=0.7, color="black"))
        ax.axvline(qc, color="black", lw=0.6, ls=":", alpha=0.6)

    ax.set_xlim(0, 0.95)
    ax.set_ylim(0, 1.0)
    ax.set_xlabel(r"$q$  (prior prob. of high type)")
    ax.set_ylabel(r"$\rho$")
    ax.set_title(r"IU pooling vs. timing thresholds  ($v_L=1,\ v_h=2$)")
    ax.legend(loc="upper left", fontsize=8, framealpha=0.9)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    fig.tight_layout()

    import os
    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "iu_pooling_regions.png")
    fig.savefig(out, dpi=150)
    print("saved:", out)
    if qc is not None:
        print(f"crossover q (rho_P = rho_dagger): {qc:.4f}")
        print(f"  q < {qc:.3f}: pooling invades the IU-unique region")
        print(f"  q > {qc:.3f}: IU region clean (Fu-like)")


if __name__ == "__main__":
    main()
