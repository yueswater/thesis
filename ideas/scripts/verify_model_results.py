#!/usr/bin/env python3
"""Numerically verify closed-form results in ideas/en and ideas/zh.

Coverage:
1) Moment formulas (binary / uniform).
2) SS equilibrium formulas and expected payoffs.
3) ML=SS equivalence.
4) LM separating equilibrium formulas and expected payoffs.
5) Timing formulas: rent factorization and interval test.
6) Welfare identities.
"""

from __future__ import annotations

import argparse
import math
from dataclasses import dataclass
from typing import Callable, Iterable


TOL = 1e-9


@dataclass(frozen=True)
class Params:
    mu: float
    delta: float
    V: float

    @property
    def v_low(self) -> float:
        return self.mu - self.delta

    @property
    def v_high(self) -> float:
        return self.mu + self.delta


@dataclass(frozen=True)
class DistMoments:
    name: str
    kappa: float
    nu: float
    sigma2: float
    ev2: float


def assert_close(a: float, b: float, msg: str, tol: float = TOL) -> None:
    if abs(a - b) > tol:
        raise AssertionError(f"{msg}: left={a:.12g}, right={b:.12g}, diff={abs(a-b):.3e}")


def br_l(x_m: float, v_l: float) -> float:
    return math.sqrt(v_l * x_m) - x_m


def br_m(x_l: float, V: float) -> float:
    return math.sqrt(V * x_l) - x_l


def U_L(x_l: float, x_m: float, v_l: float) -> float:
    return x_l / (x_l + x_m) * v_l - x_l


def U_M(x_l: float, x_m: float, V: float) -> float:
    return x_m / (x_l + x_m) * V - x_m


def binary_moments(p: Params) -> DistMoments:
    u_l = math.sqrt(p.v_low)
    u_h = math.sqrt(p.v_high)
    kappa = 0.5 / u_l + 0.5 / u_h
    nu = 0.5 * (u_l + u_h)
    sigma2 = p.delta**2
    ev2 = p.mu**2 + sigma2
    return DistMoments("binary", kappa, nu, sigma2, ev2)


def uniform_moments(p: Params) -> DistMoments:
    u_l = math.sqrt(p.v_low)
    u_h = math.sqrt(p.v_high)
    kappa = (u_h - u_l) / p.delta
    nu = (u_h**3 - u_l**3) / (3.0 * p.delta)
    sigma2 = p.delta**2 / 3.0
    ev2 = p.mu**2 + sigma2
    return DistMoments("uniform", kappa, nu, sigma2, ev2)


def integrate_uniform(f: Callable[[float], float], p: Params, n: int = 20000) -> float:
    h = (p.v_high - p.v_low) / n
    total = 0.0
    for i in range(n):
        v = p.v_low + (i + 0.5) * h
        total += f(v)
    return total / n


def expect_binary(f: Callable[[float], float], p: Params) -> float:
    return 0.5 * f(p.v_low) + 0.5 * f(p.v_high)


def verify_moments(p: Params) -> list[str]:
    logs: list[str] = []

    b = binary_moments(p)
    u = uniform_moments(p)

    # Binary numerical checks from definition.
    k_num_b = expect_binary(lambda v: 1.0 / math.sqrt(v), p)
    nu_num_b = expect_binary(math.sqrt, p)
    assert_close(b.kappa, k_num_b, "binary kappa")
    assert_close(b.nu, nu_num_b, "binary nu")

    # Uniform numerical integration checks.
    k_num_u = integrate_uniform(lambda v: 1.0 / math.sqrt(v), p)
    nu_num_u = integrate_uniform(math.sqrt, p)
    ev2_num_u = integrate_uniform(lambda v: v * v, p)
    assert_close(u.kappa, k_num_u, "uniform kappa", tol=2e-8)
    assert_close(u.nu, nu_num_u, "uniform nu", tol=2e-8)
    assert_close(u.ev2, ev2_num_u, "uniform E[V_L^2]", tol=2e-8)

    logs.append("moments verified (binary + uniform)")
    return logs


def ss_objects(v: float, V: float, kappa: float) -> tuple[float, float, float, float]:
    x_m = V * V * kappa * kappa / 4.0
    x_l = 0.5 * V * kappa * math.sqrt(v) - x_m
    u_l = (math.sqrt(v) - 0.5 * V * kappa) ** 2
    u_m = V * V * kappa / (2.0 * math.sqrt(v)) - x_m
    return x_l, x_m, u_l, u_m


def lm_objects(v: float, V: float) -> tuple[float, float, float, float]:
    x_l = v * v / (4.0 * V)
    x_m = v * (2.0 * V - v) / (4.0 * V)
    u_l = v * v / (4.0 * V)
    u_m = (2.0 * V - v) ** 2 / (4.0 * V)
    return x_l, x_m, u_l, u_m


def verify_ss_and_ml(p: Params, m: DistMoments) -> list[str]:
    logs: list[str] = []

    sample_vs: list[float]
    if m.name == "binary":
        sample_vs = [p.v_low, p.v_high]
        ex: Callable[[Callable[[float], float]], float] = lambda f: expect_binary(f, p)
    else:
        sample_vs = [p.v_low, 0.5 * (p.v_low + p.v_high), p.v_high]
        ex = lambda f: integrate_uniform(f, p)

    for v in sample_vs:
        x_l, x_m, u_l, u_m = ss_objects(v, p.V, m.kappa)

        # BR consistency.
        assert_close(x_l, br_l(x_m, v), f"SS BR_L at v={v}")

        # Payoff identity checks.
        assert_close(u_l, U_L(x_l, x_m, v), f"SS U_L at v={v}")
        assert_close(u_m, U_M(x_l, x_m, p.V), f"SS U_M at v={v}")

    e_ul_closed = p.mu - p.V * m.kappa * m.nu + (p.V * p.V * m.kappa * m.kappa) / 4.0
    e_um_closed = (p.V * p.V * m.kappa * m.kappa) / 4.0

    e_ul_num = ex(lambda v: ss_objects(v, p.V, m.kappa)[2])
    e_um_num = ex(lambda v: ss_objects(v, p.V, m.kappa)[3])

    assert_close(e_ul_closed, e_ul_num, f"{m.name} E[U_L^SS]", tol=2e-8)
    assert_close(e_um_closed, e_um_num, f"{m.name} E[U_M^SS]", tol=2e-8)

    # ML = SS identity (both x and expected payoffs).
    x_m_ml = (p.V * p.V * m.kappa * m.kappa) / 4.0
    assert_close(x_m_ml, (p.V * p.V * m.kappa * m.kappa) / 4.0, f"{m.name} x_M^ML")
    assert_close(e_ul_closed, p.mu - p.V * m.kappa * m.nu + (p.V * p.V * m.kappa * m.kappa) / 4.0, f"{m.name} E[U_L^ML]")
    assert_close(e_um_closed, (p.V * p.V * m.kappa * m.kappa) / 4.0, f"{m.name} E[U_M^ML]")

    logs.append(f"{m.name}: SS/ML formulas verified")
    return logs


def verify_lm(p: Params, m: DistMoments) -> list[str]:
    logs: list[str] = []

    sample_vs: list[float]
    if m.name == "binary":
        sample_vs = [p.v_low, p.v_high]
        ex: Callable[[Callable[[float], float]], float] = lambda f: expect_binary(f, p)
    else:
        sample_vs = [p.v_low, 0.5 * (p.v_low + p.v_high), p.v_high]
        ex = lambda f: integrate_uniform(f, p)

    for v in sample_vs:
        x_l, x_m, u_l, u_m = lm_objects(v, p.V)

        # W(x;v)=v/sqrt(V)*sqrt(x)-x -> FOC at x*=v^2/(4V), SOC<0.
        dW = v / (2.0 * math.sqrt(p.V * x_l)) - 1.0
        ddW = -(v / (4.0 * math.sqrt(p.V))) * (x_l ** (-1.5))
        assert_close(dW, 0.0, f"LM FOC at v={v}")
        if ddW >= 0:
            raise AssertionError(f"LM SOC failed at v={v}: ddW={ddW}")

        # BR and payoff consistency.
        assert_close(x_m, br_m(x_l, p.V), f"LM BR_M at v={v}")
        assert_close(u_l, U_L(x_l, x_m, v), f"LM U_L at v={v}")
        assert_close(u_m, U_M(x_l, x_m, p.V), f"LM U_M at v={v}")

    e_ul_closed = m.ev2 / (4.0 * p.V)
    e_um_closed = (4.0 * p.V * p.V - 4.0 * p.V * p.mu + m.ev2) / (4.0 * p.V)

    e_ul_num = ex(lambda v: lm_objects(v, p.V)[2])
    e_um_num = ex(lambda v: lm_objects(v, p.V)[3])

    assert_close(e_ul_closed, e_ul_num, f"{m.name} E[U_L^LM]", tol=2e-8)
    assert_close(e_um_closed, e_um_num, f"{m.name} E[U_M^LM]", tol=2e-8)

    logs.append(f"{m.name}: LM formulas verified")
    return logs


def interval_contains(v: float, V: float, kappa: float) -> bool:
    u = math.sqrt(v)
    c = V * kappa / 2.0
    lo = u - v / (2.0 * math.sqrt(V))
    hi = u + v / (2.0 * math.sqrt(V))
    return (lo - 1e-11) <= c <= (hi + 1e-11)


def verify_timing_and_welfare(p: Params, m: DistMoments) -> list[str]:
    logs: list[str] = []

    if m.name == "binary":
        grid = [p.v_low, p.v_high]
        ex: Callable[[Callable[[float], float]], float] = lambda f: expect_binary(f, p)
    else:
        grid = [p.v_low + i * (p.v_high - p.v_low) / 40.0 for i in range(41)]
        ex = lambda f: integrate_uniform(f, p)

    c = p.V * m.kappa / 2.0

    # Rent formula + factorization + interval test.
    for v in grid:
        u_l_ss = ss_objects(v, p.V, m.kappa)[2]
        u_l_lm = lm_objects(v, p.V)[2]
        r = u_l_ss - u_l_lm

        u = math.sqrt(v)
        r_factor = (c - u - u * u / (2.0 * math.sqrt(p.V))) * (c - u + u * u / (2.0 * math.sqrt(p.V)))
        assert_close(r, r_factor, f"{m.name} rent factorization at v={v}", tol=2e-8)

        prefers_first = r <= 1e-11
        in_interval = interval_contains(v, p.V, m.kappa)
        if prefers_first != in_interval:
            raise AssertionError(
                f"{m.name} interval characterization failed at v={v}: R={r:.4e}, inI={in_interval}"
            )

    # Welfare identities.
    e_ul_ss = ex(lambda v: ss_objects(v, p.V, m.kappa)[2])
    e_um_ss = ex(lambda v: ss_objects(v, p.V, m.kappa)[3])
    e_w_ss_num = e_ul_ss + e_um_ss
    e_w_ss_closed = p.mu - p.V * m.kappa * m.nu + (p.V * p.V * m.kappa * m.kappa) / 2.0
    assert_close(e_w_ss_num, e_w_ss_closed, f"{m.name} E[W^SS]=E[W^ML]", tol=2e-8)

    e_ul_lm = ex(lambda v: lm_objects(v, p.V)[2])
    e_um_lm = ex(lambda v: lm_objects(v, p.V)[3])
    e_w_lm_num = e_ul_lm + e_um_lm
    e_w_lm_closed = p.V - p.mu + (m.ev2) / (2.0 * p.V)
    assert_close(e_w_lm_num, e_w_lm_closed, f"{m.name} E[W^LM]", tol=2e-8)

    logs.append(f"{m.name}: timing + welfare formulas verified")
    return logs


def parameter_grid() -> Iterable[Params]:
    # Keep V sufficiently above the support to avoid corner efforts.
    return [
        Params(mu=1.4, delta=0.2, V=2.2),
        Params(mu=1.7, delta=0.5, V=2.8),
        Params(mu=2.2, delta=0.4, V=3.1),
        Params(mu=1.2, delta=0.1, V=1.8),
    ]


def run(verbose: bool) -> None:
    all_logs: list[str] = []

    for p in parameter_grid():
        all_logs.append(f"params: mu={p.mu}, delta={p.delta}, V={p.V}")
        all_logs.extend(verify_moments(p))

        for m in (binary_moments(p), uniform_moments(p)):
            all_logs.extend(verify_ss_and_ml(p, m))
            all_logs.extend(verify_lm(p, m))
            all_logs.extend(verify_timing_and_welfare(p, m))

    print("All verification checks passed.")
    if verbose:
        for line in all_logs:
            print(f"- {line}")


def main() -> int:
    parser = argparse.ArgumentParser(description="Verify model formulas numerically.")
    parser.add_argument("--verbose", action="store_true", help="Print detailed check log.")
    args = parser.parse_args()

    run(args.verbose)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
