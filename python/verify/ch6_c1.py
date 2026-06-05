"""Verify C1 (distorted separating) and C2 (correlated stage-0) math for v14."""
from __future__ import annotations

import numpy as np


def vhat(m: float, rho: float, V_H: float = 2.0, V_L: float = 1.0, q: float = 0.5) -> float:
    dV = V_H - V_L
    return V_L + (q + rho * (m - q)) * dV


def verify_baseline(V_H: float = 2.0, V_L: float = 1.0, q: float = 0.5) -> None:
    dV = V_H - V_L
    R = V_H**2 / (V_L * (2 * V_H - V_L))
    vq = vhat(q, 0, V_H, V_L, q)
    rho_star = (R - 1) * vq / (dV * (1 - q + R * q))
    beta = dV / (V_H + V_L)
    rho_P = beta**2 * vq / ((1 - q) * dV * (1 - beta**2))

    v0 = vhat(0, rho_star, V_H, V_L, q)
    v1 = vhat(1, rho_star, V_H, V_L, q)
    alpha_sep = 1 - v0 / v1
    xL_riley = V_H**2 / (4 * v0) * (1 - np.sqrt(alpha_sep))**2
    low_dev = V_H * (2 * V_L - V_H) / (4 * v1)

    pi_H_sep = V_H**2 / (4 * v1)
    z_riley = np.sqrt(xL_riley)
    pi_H_dev_at_riley = V_H * z_riley / np.sqrt(v0) - xL_riley
    hi_ic_slack = pi_H_sep - pi_H_dev_at_riley

    print(f"=== V_H={V_H}, V_L={V_L}, q={q} ===")
    print(f"R          = {R:.6f}  (expected 4/3 ≈ 1.333333 for baseline)")
    print(f"rho_star   = {rho_star:.6f}  (expected 3/7 ≈ 0.428571)")
    print(f"rho_P      = {rho_P:.6f}  (expected 3/8 = 0.375000)")
    print(f"V_hat(0)|rho* = {v0:.6f}  (expected 9/7 ≈ 1.285714)")
    print(f"V_hat(1)|rho* = {v1:.6f}  (expected 12/7 ≈ 1.714286)")
    print(f"alpha_sep  = {alpha_sep:.6f}  (expected 1/4 = 0.250000)")
    print(f"x_L^Riley  = {xL_riley:.6f}  (expected 7/36 ≈ 0.194444)")
    print(f"Low-type deviation payoff = {low_dev:.6f}  (expected 0 for V_H=2V_L)")
    print(f"High-type IC slack at Riley = {hi_ic_slack:.8f}  (expected ≈ 0)")
    print()


def verify_general_case(V_H: float = 3.0, V_L: float = 1.0, q: float = 0.5) -> None:
    dV = V_H - V_L
    R = V_H**2 / (V_L * (2 * V_H - V_L))
    vq = V_L + q * dV
    rho_star = (R - 1) * vq / (dV * (1 - q + R * q))
    beta = dV / (V_H + V_L)
    rho_P = beta**2 * vq / ((1 - q) * dV * (1 - beta**2))
    low_dev_sign = V_H * (2 * V_L - V_H)

    print(f"=== V_H={V_H}, V_L={V_L}, q={q} (V_H > 2V_L case) ===")
    print(f"R          = {R:.6f}")
    print(f"rho_star   = {rho_star:.6f}")
    print(f"rho_P      = {rho_P:.6f}")
    print(f"V_H*(2V_L-V_H) = {low_dev_sign:.2f}  (negative => low-type IC auto-satisfied)")
    print(f"=> rho** = 1, distorted sep exists for all rho in (0,1]")
    print()


def main() -> None:
    verify_baseline()
    verify_general_case()


if __name__ == "__main__":
    main()
