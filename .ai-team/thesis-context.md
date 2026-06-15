# Thesis Context

## Working Title

雙重不對稱下的分離、混同與內生時序

## Core Topic

This thesis studies two-player Tullock contests with asymmetric information and endogenous timing.

The informed player privately observes his own valuation. The uninformed player does not observe either realized valuation directly, but may update beliefs from observable actions.

The core issue is whether the informed player prefers to move early or late when effort may reveal information.

## Baseline Literature

The thesis is most directly motivated by Fu (2006), which studies endogenous timing in a two-player Tullock contest with asymmetric information.

In Fu's model, when the informed player moves first, his effort may reveal his type. The uninformed player then updates beliefs and adjusts effort. This signal-belief-response channel may erode the informed player's information rent, generating a preference for moving second.

This thesis does not simply repeat Fu's result. It asks what mechanism is actually responsible for Fu's result.

## Main Research Question

The central question is:

> Is the informed player's preference for moving second caused by the strategic value of timing itself, or by the information-correlation mechanism through which the informed player's type affects the uninformed player's expected valuation?

## Main Contribution

The thesis introduces a unified correlation framework indexed by rho:

- rho = 0: independent valuations;
- 0 < rho < 1: partially correlated valuations;
- rho = 1: fully correlated valuations, corresponding to Fu's setting.

The goal is to connect the independent benchmark and Fu's fully correlated model as two endpoints of a continuous theoretical spectrum.

## Economic Mechanism

When rho = 0, the informed player's type contains no information about the uninformed player's valuation. Therefore, even if the uninformed player infers the informed player's type, the uninformed player's posterior expected valuation does not change.

In this case, belief updating occurs but does not affect behavior.

When rho > 0, the informed player's type becomes informative about the uninformed player's own valuation. Then the informed player's effort can change the uninformed player's posterior expected valuation, which changes the uninformed player's best response.

Thus, positive correlation restores the signal-belief-response channel.

## Main Regimes

The thesis compares three timing regimes:

- SS: simultaneous move;
- UI: uninformed player moves first, informed player moves second;
- IU: informed player moves first, uninformed player moves second.

The analysis should distinguish:

1. equilibrium effort within each regime;
2. ex ante payoff comparison across regimes;
3. endogenous timing equilibrium at stage 0;
4. welfare and dissipation implications.

## Baseline Model

In the independent benchmark:

- VI and VU are independent and identically distributed;
- both take values vH or vL;
- Pr(VI = vH) = Pr(VU = vH) = q;
- vH > vL > 0;
- rho = 0.

The key property is:

E[VU | signal about VI] = E[VU].

Therefore, the uninformed player's best response does not depend on posterior beliefs about the informed player's type.

This benchmark is not a disposable special case. It is the zero-correlation baseline that isolates the pure timing effect from the signal-belief-response effect.

## Core Model

In the partially correlated model:

- VI and VU have the same marginal distribution;
- their high-type indicators have correlation rho in [0, 1];
- rho measures how informative the informed player's type is about the uninformed player's valuation.

The goal is to examine how increasing rho affects:

1. posterior expected valuation;
2. the uninformed player's best response;
3. separating equilibrium;
4. pooling equilibrium;
5. coexistence of equilibria;
6. endogenous timing.

## Fu Endpoint

When rho = 1, the model should collapse into Fu's fully correlated setting.

The team should always check whether any claim about rho = 1 is consistent with Fu's logic.

## Welfare

The thesis also studies welfare and rent dissipation.

The goal is not to claim that one timing regime is always socially superior.

Instead, the thesis should show that timing, information revelation, valuation allocation, and rent dissipation interact in a parameter-dependent way.

## Current Research Direction

The thesis may later explore an extended timing structure in which timing choice and committed effort are chosen together after information is realized.

This extension is distinct from Protopappas-style timing-as-signal models and should not be confused with the current benchmark/core model unless explicitly requested.