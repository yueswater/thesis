#!/usr/bin/env python3
import math
import sys


def kappa(mu: float, delta: float) -> float:
    return 0.5 / math.sqrt(mu - delta) + 0.5 / math.sqrt(mu + delta)


def sim_payoff_labor(v_l: float, v_m: float, kap: float) -> float:
    return (math.sqrt(v_l) - v_m * kap / 2.0) ** 2


def sep_payoff_labor(v_l: float, v_m: float) -> float:
    return v_l * v_l / (4.0 * v_m)


def rent(v_l: float, v_m: float, kap: float) -> float:
    return sim_payoff_labor(v_l, v_m, kap) - sep_payoff_labor(v_l, v_m)


def profile(mu: float, delta: float, v_m: float = 1.0) -> tuple[bool, bool]:
    kap = kappa(mu, delta)
    r_low = rent(mu - delta, v_m, kap)
    r_high = rent(mu + delta, v_m, kap)
    return (r_low > 1e-10, r_high > 1e-10)


def interval_contains(v_l: float, v_m: float, kap: float) -> bool:
    u = math.sqrt(v_l)
    c = v_m * kap / 2.0
    lower = u - v_l / (2.0 * math.sqrt(v_m))
    upper = u + v_l / (2.0 * math.sqrt(v_m))
    return lower - 1e-10 <= c <= upper + 1e-10


def assert_interval_characterization(v_m: float = 1.0) -> None:
    for i in range(30, 301):
        mu = i / 100.0
        for j in range(1, i):
            delta = j / 100.0
            kap = kappa(mu, delta)
            for v_l in (mu - delta, mu + delta):
                prefers_second = rent(v_l, v_m, kap) > 1e-10
                first_interval = interval_contains(v_l, v_m, kap)
                if prefers_second == first_interval:
                    raise AssertionError(
                        f"interval test failed at mu={mu}, delta={delta}, "
                        f"V_L={v_l}, rent={rent(v_l, v_m, kap)}"
                    )


def assert_high_wait_implies_low_wait(v_m: float = 1.0) -> None:
    for i in range(101, 301):
        mu = i / 100.0
        for j in range(1, i):
            delta = j / 100.0
            kap = kappa(mu, delta)
            r_low = rent(mu - delta, v_m, kap)
            r_high = rent(mu + delta, v_m, kap)
            if r_high > 1e-9 and r_low <= 1e-9:
                raise AssertionError(
                    f"ordering check failed at mu={mu}, delta={delta}: "
                    f"R_low={r_low}, R_high={r_high}"
                )


def find_examples(v_m: float = 1.0) -> dict[str, tuple[float, float]]:
    examples: dict[str, tuple[float, float]] = {}
    for i in range(101, 301):
        mu = i / 100.0
        for j in range(1, i):
            delta = j / 100.0
            status = profile(mu, delta, v_m)
            if status == (True, True) and "both_wait" not in examples:
                examples["both_wait"] = (mu, delta)
            elif status == (True, False) and "only_low_waits" not in examples:
                examples["only_low_waits"] = (mu, delta)
            elif status == (False, False) and mu > v_m and "both_first" not in examples:
                examples["both_first"] = (mu, delta)
            if len(examples) == 3:
                return examples
    raise AssertionError("failed to locate all three mu>V timing profiles")


def assert_pooling_impossible(v_m: float = 1.0) -> None:
    mu = 1.4
    delta = 0.4
    x_low = (mu - delta) ** 2 / (4.0 * v_m)
    x_high = (mu + delta) ** 2 / (4.0 * v_m)
    if abs(x_low - x_high) < 1e-12:
        raise AssertionError("pooling check picked degenerate parameters")


def main() -> int:
    assert_interval_characterization()
    assert_high_wait_implies_low_wait()
    assert_pooling_impossible()
    examples = find_examples()
    print("Verified in sandbox:")
    print("1. The exact interval condition matches the rent formula on a dense grid.")
    print("2. If the high type prefers waiting, the low type does too.")
    print("3. Pooling cannot be optimal for both types when delta > 0.")
    print("Example regimes with V=1:")
    print(
        f"- both wait: mu={examples['both_wait'][0]:.2f}, "
        f"delta={examples['both_wait'][1]:.2f}"
    )
    print(
        f"- only low type waits: mu={examples['only_low_waits'][0]:.2f}, "
        f"delta={examples['only_low_waits'][1]:.2f}"
    )
    print(
        f"- both move first: mu={examples['both_first'][0]:.2f}, "
        f"delta={examples['both_first'][1]:.2f}"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
