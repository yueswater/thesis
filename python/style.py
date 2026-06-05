from __future__ import annotations

import matplotlib.pyplot as plt

RCPARAMS: dict[str, object] = {
    "font.family": "Times New Roman",
    "font.size": 10,
    "axes.labelsize": 10,
    "legend.fontsize": 8,
    "xtick.labelsize": 9,
    "ytick.labelsize": 9,
    "mathtext.fontset": "stix",
    "mathtext.rm": "Times New Roman",
    "mathtext.it": "Times New Roman:italic",
    "mathtext.bf": "Times New Roman:bold",
}


def apply() -> None:
    plt.rcParams.update(RCPARAMS)
