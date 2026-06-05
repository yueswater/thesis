from __future__ import annotations

import math
import sys

TOL = 1e-9


def assert_close(a: float, b: float, label: str) -> None:
    if abs(a - b) > TOL:
        raise AssertionError(f"{label}: left={a:.12g}, right={b:.12g}")


def hat_v_1(p_h: float, v_h: float, V_L: float) -> float:
    return p_h * v_h + (1.0 - p_h) * V_L


def hat_v_0(p_L: float, v_h: float, V_L: float) -> float:
    return (1.0 - p_L) * v_h + p_L * V_L


def ratio(p_h: float, p_L: float, v_h: float, V_L: float) -> float:
    return hat_v_1(p_h, v_h, V_L) / hat_v_0(p_L, v_h, V_L)


def boundary(p_h: float, v_h: float, V_L: float) -> float:
    r = v_h * v_h / (V_L * (2.0 * v_h - V_L))
    return (r * v_h - V_L - p_h * (v_h - V_L)) / (r * (v_h - V_L))


def verify_marginal_consistency() -> None:
    for q, p_h in ((0.3, 0.5), (0.5, 0.75), (0.7, 0.9)):
        p_L = 1.0 - q * (1.0 - p_h) / (1.0 - q)
        lhs = (1.0 - q) * (1.0 - p_L)
        rhs = q * (1.0 - p_h)
        assert_close(lhs, rhs, "marginal consistency")


def verify_independence_and_fu_points() -> None:
    v_h, V_L = 2.0, 1.0
    r = v_h * v_h / (V_L * (2.0 * v_h - V_L))
    for q in (0.3, 0.5, 0.7):
        assert_close(ratio(q, 1.0 - q, v_h, V_L), 1.0, "independence ratio")
    fu_ratio = ratio(1.0, 1.0, v_h, V_L)
    if fu_ratio <= r:
        raise AssertionError("Fu point should violate the separating condition")


def verify_boundary_equation() -> None:
    v_h, V_L = 2.0, 1.0
    r = v_h * v_h / (V_L * (2.0 * v_h - V_L))
    for p_h in (0.3, 0.5, 0.7, 0.9):
        p_L = boundary(p_h, v_h, V_L)
        assert_close(ratio(p_h, p_L, v_h, V_L), r, "boundary ratio")


def verify_comparative_statics() -> None:
    v_h, V_L = 2.0, 1.0
    base = ratio(0.6, 0.7, v_h, V_L)
    if ratio(0.7, 0.7, v_h, V_L) <= base:
        raise AssertionError("ratio should rise in p_H")
    if ratio(0.6, 0.8, v_h, V_L) <= base:
        raise AssertionError("ratio should rise in p_L")


def main() -> int:
    verify_marginal_consistency()
    verify_independence_and_fu_points()
    verify_boundary_equation()
    verify_comparative_statics()
    print("verify results: Chapter 6 consistency checks passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
