"""
When is UI (uninformed leads, informed follows) a stage-0 pure-strategy
equilibrium in the iid benchmark?

Stage-0 deviations from UI = (U early, I late):
  - U -> late  => (late,late) = SS.  Need pi_U^UI >= pi_U^SS.
  - I -> early  => (early,early) = SS.  Need pi_I^UI >= pi_I^SS.

So UI is a Nash profile at stage 0 iff BOTH hold.

Definitions (v_L = 1, v_H = R > 1):
  vbar = q v_H + (1-q) v_L
  Ahat = vbar (q/sqrt(v_H) + (1-q)/sqrt(v_L))
  Bhat = vbar (q/v_H   + (1-q)/v_L)

Subgame payoffs (INTERIOR formulas, as stated in the propositions):
  SS:  cS = Ahat/(1+Bhat);   pi_I^SS(v) = (sqrt(v) - cS)^2;  pi_U^SS = Ahat^2 Bhat/(1+Bhat)^2
  UI:  cU = Ahat/2;          pi_I^UI(v) = (sqrt(v) - cU)^2;  pi_U^UI = Ahat^2/4

Interiority (informed of each type invests >= 0):
  x_I^SS(v) = cS (sqrt(v) - cS) >= 0  <=>  sqrt(v) >= cS
  x_I^UI(v) = cU (sqrt(v) - cU) >= 0  <=>  sqrt(v) >= cU
(low type binds; cU > cS since Bhat>1, so UI-interiority is the tighter one.)
"""

import numpy as np
import sympy as sp


# ----------------------------------------------------------------------
# 1. Symbolic sign of the informed's deviation incentive (interior regime)
# ----------------------------------------------------------------------
def symbolic_check():
    q, R = sp.symbols('q R', positive=True)   # vL=1, vH=R
    vL, vH = sp.Integer(1), R
    vbar = q * vH + (1 - q) * vL
    Ahat = vbar * (q / sp.sqrt(vH) + (1 - q) / sp.sqrt(vL))
    Bhat = vbar * (q / vH + (1 - q) / vL)

    cS = Ahat / (1 + Bhat)
    cU = Ahat / 2

    piI_SS = q * (sp.sqrt(vH) - cS)**2 + (1 - q) * (sp.sqrt(vL) - cS)**2
    piI_UI = q * (sp.sqrt(vH) - cU)**2 + (1 - q) * (sp.sqrt(vL) - cU)**2

    # D = piI_SS - piI_UI ; UI holds (informed side) iff D <= 0
    D = piI_SS - piI_UI

    # Correct factorization: D = (cU-cS)*(2 E[sqrt V] - (cS+cU))
    Esqrt = q * sp.sqrt(vH) + (1 - q) * sp.sqrt(vL)
    factor = sp.simplify(D - (cU - cS) * (2 * Esqrt - (cS + cU)))
    print("D - (cU-cS)(2E[sqrtV]-(cS+cU)) simplifies to:", factor, " (0 confirms identity)")
    print()
    print("cU - cS > 0 since Bhat>1, so:")
    print("   sign(D) = sign( 2 E[sqrt V] - (cS + cU) )")
    print("   UI fails (informed deviates to SS)  iff  D>0  iff  2 E[sqrt V] > cS + cU")
    print("   UI holds (informed follows)         iff  D<=0 iff  2 E[sqrt V] <= cS + cU")
    return q, R, cS, cU, Ahat, Bhat


# ----------------------------------------------------------------------
# 2. Numerical sweep over (q, R): classify each point
# ----------------------------------------------------------------------
def numeric():
    qs = np.linspace(0.001, 0.999, 400)
    Rs = np.linspace(1.001, 50.0, 400)      # vH/vL ratio
    Q, Rg = np.meshgrid(qs, Rs)

    vL = 1.0
    vH = Rg
    vbar = Q * vH + (1 - Q) * vL
    Ahat = vbar * (Q / np.sqrt(vH) + (1 - Q) / np.sqrt(vL))
    Bhat = vbar * (Q / vH + (1 - Q) / vL)

    cS = Ahat / (1 + Bhat)
    cU = Ahat / 2

    # interiority (low type, v=1): sqrt(1)=1 >= c
    interior_SS = (1.0 >= cS)
    interior_UI = (1.0 >= cU)
    interior = interior_SS & interior_UI

    # Direct difference (no hand factorization) to be sign-safe:
    Esqrt = Q * np.sqrt(vH) + (1 - Q) * np.sqrt(vL)
    piI_SS = Q * (np.sqrt(vH) - cS)**2 + (1 - Q) * (np.sqrt(vL) - cS)**2
    piI_UI = Q * (np.sqrt(vH) - cU)**2 + (1 - Q) * (np.sqrt(vL) - cU)**2
    D = piI_SS - piI_UI                      # informed prefers SS when D>0

    # U side always holds; UI is equilibrium iff informed does not deviate: D <= 0
    ui_holds = (D <= 0)
    ui_eq = interior & ui_holds

    g = 2 * Esqrt - (cS + cU)                # sign(g) == sign(D) since cU>cS
    if interior.any():
        gi, Di = g[interior], D[interior]
        print("Over INTERIOR region:")
        print("  min(2E[sqrtV]-(cS+cU)) = %.6e  (>0 => informed strictly prefers SS everywhere)" % gi.min())
        print("  min D = %.6e , max D = %.6e" % (Di.min(), Di.max()))
        idx = np.unravel_index(np.argmin(np.where(interior, g, np.inf)), g.shape)
        print("  smallest gap at q=%.4f, R=%.4f (Bhat=%.4f) -> only ->0 at the degenerate edge\n"
              % (Q[idx], Rg[idx], Bhat[idx]))

    print("Bhat>=1 everywhere:", bool(np.all(Bhat >= 1 - 1e-12)))
    print("U-side (pi_U^UI>=pi_U^SS) always holds:",
          bool(np.all(Ahat**2 / 4 - Ahat**2 * Bhat / (1 + Bhat)**2 >= -1e-12)))
    print()
    print("Among INTERIOR points (n=%d):" % interior.sum())
    if interior.sum():
        frac = ui_eq.sum() / interior.sum()
        print("  fraction where UI is an equilibrium: %.4f" % frac)
        print("  fraction where UI fails (I deviates): %.4f" % (1 - frac))
    print("Among ALL sampled points:")
    print("  interior fraction: %.4f" % (interior.mean()))

    # boundary D=0 within interior: report sample boundary points
    print("\nSample (q, R) on the informed-indifference boundary D=0 (interior):")
    for qfix in [0.1, 0.3, 0.5, 0.7, 0.9]:
        j = np.argmin(np.abs(qs - qfix))
        col_D = (cU - cS)[:, j] + 0.0
        col_int = interior[:, j]
        # find sign change of D along R
        sign = np.sign(D[:, j])
        idx = np.where(np.diff(sign) != 0)[0]
        bnds = [Rs[i] for i in idx if col_int[i]]
        print(f"  q={qfix:.2f}: D=0 crossing(s) at R≈{['%.3f'%b for b in bnds] if bnds else 'none in interior'}; "
              f"interior R-range≈[{Rs[col_int].min() if col_int.any() else float('nan'):.2f},"
              f"{Rs[col_int].max() if col_int.any() else float('nan'):.2f}]")

    return qs, Rs, Q, Rg, interior, ui_eq, D


# ----------------------------------------------------------------------
# 3. Plot the region map
# ----------------------------------------------------------------------
def plot(qs, Rs, interior, ui_eq, D):
    import matplotlib
    matplotlib.use("Agg")
    import matplotlib.pyplot as plt

    cat = np.zeros_like(D, dtype=int)         # 0 = non-interior
    cat[interior & (D > 0)] = 1               # interior, UI fails (I deviates to SS)
    cat[interior & (D <= 0)] = 2              # interior, UI is equilibrium

    fig, ax = plt.subplots(figsize=(7, 5))
    from matplotlib.colors import ListedColormap
    cmap = ListedColormap(["#dddddd", "#f4a582", "#92c5de"])
    ax.pcolormesh(qs, Rs, cat, cmap=cmap, shading="auto", vmin=0, vmax=2)

    import matplotlib.patches as mpatches
    handles = [
        mpatches.Patch(color="#dddddd", label="non-interior (formulas n/a)"),
        mpatches.Patch(color="#f4a582", label="UI fails: informed deviates to SS"),
        mpatches.Patch(color="#92c5de", label="UI is equilibrium (I prefers to follow)"),
    ]
    ax.legend(handles=handles, loc="upper right", fontsize=8)
    ax.set_xlabel("q  (prob. of high type)")
    ax.set_ylabel("R = v_H / v_L")
    ax.set_title("Is UI a stage-0 pure-strategy equilibrium?  (iid benchmark)")
    fig.tight_layout()
    out = "python/ui_equilibrium_region.png"
    fig.savefig(out, dpi=140)
    print("\nsaved:", out)


if __name__ == "__main__":
    print("=" * 64)
    print("SYMBOLIC")
    print("=" * 64)
    symbolic_check()
    print()
    print("=" * 64)
    print("NUMERIC SWEEP")
    print("=" * 64)
    qs, Rs, Q, Rg, interior, ui_eq, D = numeric()
    plot(qs, Rs, interior, ui_eq, D)
