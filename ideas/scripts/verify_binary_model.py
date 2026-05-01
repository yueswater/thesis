#!/usr/bin/env python3
from __future__ import annotations

import math
import sys


TOL = 1e-9


def assert_close(a: float, b: float, label: str) -> None:
    if abs(a - b) > TOL:
        raise AssertionError(f"{label}: left={a:.12g}, right={b:.12g}")


def mean(v_low: float, v_high: float, q: float) -> float:
    return (1.0 - q) * v_low + q * v_high


def variance(v_low: float, v_high: float, q: float) -> float:
    return q * (1.0 - q) * (v_high - v_low) ** 2


def kappa(v_low: float, v_high: float, q: float) -> float:
    return (1.0 - q) / math.sqrt(v_low) + q / math.sqrt(v_high)


def nu(v_low: float, v_high: float, q: float) -> float:
    return (1.0 - q) * math.sqrt(v_low) + q * math.sqrt(v_high)


def lam(v_low: float, v_high: float, q: float) -> float:
    return (1.0 - q) / v_low + q / v_high


def ul_ss_type(v: float, v_low: float, v_high: float, q: float, V: float) -> float:
    c = V * kappa(v_low, v_high, q) / (1.0 + V * lam(v_low, v_high, q))
    return (math.sqrt(v) - c) ** 2


def ul_lm_type(v: float, V: float) -> float:
    return v * v / (4.0 * V)


def rent(v: float, v_low: float, v_high: float, q: float, V: float) -> float:
    return ul_ss_type(v, v_low, v_high, q, V) - ul_lm_type(v, V)


def e_ul_ss(v_low: float, v_high: float, q: float, V: float) -> float:
    mu = mean(v_low, v_high, q)
    kap = kappa(v_low, v_high, q)
    nu_val = nu(v_low, v_high, q)
    lam_val = lam(v_low, v_high, q)
    denom = 1.0 + V * lam_val
    return mu - 2.0 * V * kap * nu_val / denom + (V * kap) ** 2 / denom**2


def e_ul_lm(v_low: float, v_high: float, q: float, V: float) -> float:
    return ((1.0 - q) * v_low * v_low + q * v_high * v_high) / (4.0 * V)


def verify_moments() -> None:
    for v_low, v_high, q in ((0.8, 1.6, 0.3), (0.8, 1.6, 0.5), (0.8, 1.6, 0.7), (1.2, 2.4, 0.4)):
        mu = mean(v_low, v_high, q)
        sigma2 = variance(v_low, v_high, q)
        assert_close(mu, (1.0 - q) * v_low + q * v_high, "binary mean")
        assert_close(sigma2, q * (1.0 - q) * (v_high - v_low) ** 2, "binary variance")
        assert_close(kappa(v_low, v_high, q), (1.0 - q) / math.sqrt(v_low) + q / math.sqrt(v_high), "kappa")
        assert_close(nu(v_low, v_high, q), (1.0 - q) * math.sqrt(v_low) + q * math.sqrt(v_high), "nu")
        assert_close(lam(v_low, v_high, q), (1.0 - q) / v_low + q / v_high, "lambda")


def verify_lm_formula() -> None:
    for v_low, v_high, q, V in ((0.8, 1.6, 0.3, 1.0), (0.8, 1.6, 0.7, 1.4), (1.2, 2.0, 0.4, 1.8)):
        mu = mean(v_low, v_high, q)
        sigma2 = variance(v_low, v_high, q)
        lhs = e_ul_lm(v_low, v_high, q, V)
        rhs = (mu * mu + sigma2) / (4.0 * V)
        assert_close(lhs, rhs, "E[U_L^LM]")


def verify_timing_decomposition() -> None:
    for v_low, v_high, q, V in ((0.8, 1.6, 0.3, 1.0), (0.8, 1.6, 0.5, 1.0), (0.8, 1.6, 0.7, 1.0)):
        lhs = e_ul_lm(v_low, v_high, q, V) - e_ul_ss(v_low, v_high, q, V)
        rhs = -((1.0 - q) * rent(v_low, v_low, v_high, q, V) + q * rent(v_high, v_low, v_high, q, V))
        assert_close(lhs, rhs, "Delta_L^LM decomposition")


def verify_binary_ic() -> None:
    for v_low, v_high, V in ((0.8, 1.6, 1.0), (1.1, 2.2, 1.7), (1.4, 2.1, 2.0)):
        ic_h = v_high * v_high / (4.0 * V) - (v_high * v_low / (2.0 * V) - v_low * v_low / (4.0 * V))
        ic_l = v_low * v_low / (4.0 * V) - (v_low * v_high / (2.0 * V) - v_high * v_high / (4.0 * V))
        target = (v_high - v_low) ** 2 / (4.0 * V)
        assert_close(ic_h, target, "IC_H")
        assert_close(ic_l, target, "IC_L")


def main() -> int:
    verify_moments()
    verify_lm_formula()
    verify_timing_decomposition()
    verify_binary_ic()
    print("Verified binary-model formulas with general prior q.")
    print("1. Mean, variance, and moment formulas match direct weighted averages.")
    print("2. LM expected payoff equals (mu^2 + sigma^2) / (4V).")
    print("3. Delta_L^LM equals -[(1-q)R(V_l) + qR(V_H)].")
    print("4. Binary IC_H and IC_L remain (V_H - V_l)^2 / (4V), independent of q.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
