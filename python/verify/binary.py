from __future__ import annotations

import math
import sys

TOL = 1e-9


def assert_close(a: float, b: float, label: str) -> None:
    if abs(a - b) > TOL:
        raise AssertionError(f"{label}: left={a:.12g}, right={b:.12g}")


def mean(V_L: float, v_h: float, q: float) -> float:
    return (1.0 - q) * V_L + q * v_h


def variance(V_L: float, v_h: float, q: float) -> float:
    return q * (1.0 - q) * (v_h - V_L) ** 2


def kappa(V_L: float, v_h: float, q: float) -> float:
    return (1.0 - q) / math.sqrt(V_L) + q / math.sqrt(v_h)


def nu(V_L: float, v_h: float, q: float) -> float:
    return (1.0 - q) * math.sqrt(V_L) + q * math.sqrt(v_h)


def lam(V_L: float, v_h: float, q: float) -> float:
    return (1.0 - q) / V_L + q / v_h


def rent(v: float, V_L: float, v_h: float, q: float, V: float) -> float:
    c = V * kappa(V_L, v_h, q) / (1.0 + V * lam(V_L, v_h, q))
    return (math.sqrt(v) - c) ** 2 - v * v / (4.0 * V)


def verify_binary_moments() -> None:
    for V_L, v_h, q in ((0.6, 1.8, 0.3), (0.8, 1.6, 0.5), (0.9, 1.5, 0.7)):
        assert_close(mean(V_L, v_h, q), (1.0 - q) * V_L + q * v_h, "mean")
        assert_close(variance(V_L, v_h, q), q * (1.0 - q) * (v_h - V_L) ** 2, "variance")
        assert_close(kappa(V_L, v_h, q), (1.0 - q) / math.sqrt(V_L) + q / math.sqrt(v_h), "kappa")
        assert_close(nu(V_L, v_h, q), (1.0 - q) * math.sqrt(V_L) + q * math.sqrt(v_h), "nu")
        assert_close(lam(V_L, v_h, q), (1.0 - q) / V_L + q / v_h, "lambda")


def verify_timing_decomposition() -> None:
    for V_L, v_h, q, V in ((0.6, 1.8, 0.3, 1.0), (0.8, 1.6, 0.5, 1.0), (0.9, 1.5, 0.7, 1.3)):
        mu = mean(V_L, v_h, q)
        sigma2 = variance(V_L, v_h, q)
        kap = kappa(V_L, v_h, q)
        nu_val = nu(V_L, v_h, q)
        lam_val = lam(V_L, v_h, q)
        denom = 1.0 + V * lam_val
        e_ss = mu - 2.0 * V * kap * nu_val / denom + (V * kap) ** 2 / denom**2
        e_iu = (mu * mu + sigma2) / (4.0 * V)
        lhs = e_iu - e_ss
        rhs = -((1.0 - q) * rent(V_L, V_L, v_h, q, V) + q * rent(v_h, V_L, v_h, q, V))
        assert_close(lhs, rhs, "Delta_I^(IU)")


def verify_binary_ic() -> None:
    for V_L, v_h, V in ((0.8, 1.6, 1.0), (1.0, 2.0, 1.6), (1.3, 2.1, 2.0)):
        ic_h = v_h * v_h / (4.0 * V) - (v_h * V_L / (2.0 * V) - V_L * V_L / (4.0 * V))
        ic_L = V_L * V_L / (4.0 * V) - (V_L * v_h / (2.0 * V) - v_h * v_h / (4.0 * V))
        target = (v_h - V_L) ** 2 / (4.0 * V)
        assert_close(ic_h, target, "IC_H")
        assert_close(ic_L, target, "IC_L")


def main() -> int:
    verify_binary_moments()
    verify_timing_decomposition()
    verify_binary_ic()
    print("verify binary: all checks passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
