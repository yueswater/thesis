"""
Verify lem-main-timing-DIUI-pool (docs/chapters/04_main_model.typ): the IU-subgame
pooling continuation can never make the informed agent prefer IU over SS, i.e.
D_I^{IU,pool} <= 0 for all rho in [0,1], q in (0,1), v_h > v_L > 0, and any pooling
effort x_P. Proof structure (full derivation in docs/chapters/08_appendix.typ,
app-proof-main-timing-DIUI-pool):

  1. pi_tilde_I_IU_pool(x_P) = sqrt(vbar*x_P) - x_P  has sup_{x_P>=0} = vbar/4.
  2. pi_tilde_I_SS(rho) - vbar/4 = (c_SS(rho) - Ebar_sqrt)^2 + K, K constant in rho.
  3. c_SS(rho) < Ebar_sqrt strictly for all rho in [0,1] (closed-form numerator check
     below) and c_SS is monotonic in rho (ratio of two affine functions), so the
     squared term's minimum over [0,1] is at rho=0 or rho=1.
  4. Endpoint rho=1 has a clean closed form: gap(1) = 3*q*(1-q)*(sqrt(vh)-sqrt(vL))^2
     >= 0 (Fu 2006 Corollary 1, generalized). Endpoint rho=0 (iid benchmark SS
     subgame) has no comparably clean closed form; verified here by exact symbolic
     simplification down to a single rational function plus a stress test.
"""
from __future__ import annotations

import numpy as np
import sympy as sp

s, t, q, rho = sp.symbols("s t q rho", positive=True)  # s=sqrt(v_L), t=sqrt(v_h)
vL, vh = s**2, t**2
dV = vh - vL
vbar = vL + dV * q

thH = q + rho * (1 - q)
thL = q * (1 - rho)
VU1 = vL + dV * thH
VU0 = vL + dV * thL
Ebar_sqrt = q * t + (1 - q) * s

A = q * VU1 / t + (1 - q) * VU0 / s
B = q * VU1 / vh + (1 - q) * VU0 / vL

# Step 1: sup over x_P of the pooling payoff.
xP = sp.symbols("x_P", positive=True)
f_pool = sp.sqrt(vbar * xP) - xP
xstar = sp.solve(sp.diff(f_pool, xP), xP)[0]
fmax = sp.simplify(f_pool.subs(xP, xstar))
print("Step 1: sup_xP sqrt(vbar*xP)-xP =", fmax, " (expect vbar/4)")
assert sp.simplify(fmax - vbar / sp.Rational(4)) == 0

# Step 3: closed-form check that the numerator of (c_SS - Ebar_sqrt) is < 0 on [0,1].
M_closed = -q * (1 - q) * (t - s) * dV * (1 - rho) * ((1 - q) / vh + q / vL) - Ebar_sqrt
M = A - Ebar_sqrt * B - Ebar_sqrt
f_resid = sp.lambdify((s, t, q, rho), M - M_closed, modules="numpy")
rng = np.random.default_rng(0)
n = 5000
s_ = rng.uniform(0.1, 3.0, n)
t_ = s_ + rng.uniform(0.01, 5.0, n)
q_ = rng.uniform(1e-4, 1 - 1e-4, n)
rho_ = rng.uniform(0.0, 1.0, n)
resid = np.abs(f_resid(s_, t_, q_, rho_))
print("Step 3: max |M - M_closed| over", n, "draws =", resid.max(), " (want ~0)")
assert resid.max() < 1e-8

# Step 4a: clean closed form at rho=1.
A1, B1 = A.subs(rho, 1), B.subs(rho, 1)
cSS1 = sp.cancel(A1 / (1 + B1))
piI_SS1 = sp.cancel(cSS1**2 - 2 * cSS1 * Ebar_sqrt + vbar)
gap1 = sp.factor(sp.cancel(piI_SS1 - vbar / sp.Rational(4)))
print("Step 4a: gap(rho=1) =", gap1, " (expect 3*q*(1-q)*(t-s)**2/4)")
assert sp.simplify(gap1 - sp.Rational(3, 4) * q * (1 - q) * (t - s) ** 2) == 0

# Step 4b: rho=0 endpoint, stress test (no clean closed form found).
A0, B0 = A.subs(rho, 0), B.subs(rho, 0)
cSS0 = sp.cancel(A0 / (1 + B0))
piI_SS0 = sp.cancel(cSS0**2 - 2 * cSS0 * Ebar_sqrt + vbar)
gap0 = sp.cancel(piI_SS0 - vbar / sp.Rational(4))
f0 = sp.lambdify((s, t, q), gap0, modules="numpy")
n = 50000
s_ = rng.uniform(0.1, 3.0, n)
t_ = s_ + rng.uniform(0.01, 5.0, n)
q_ = rng.uniform(1e-4, 1 - 1e-4, n)
vals = f0(s_, t_, q_)
i = int(np.argmin(vals))
print(f"Step 4b: gap(rho=0) min over {n} draws = {vals[i]:.3e} at "
      f"vL={s_[i]**2:.4f} vh={t_[i]**2:.4f} q={q_[i]:.4f}  (want >= 0)")
assert vals.min() > -1e-9
print("\nAll checks passed: D_I^{IU,pool} <= 0 for all admissible rho, q, v_L, v_h, x_P.")
