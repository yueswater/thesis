from __future__ import annotations

import os
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FIGURES_DIR = ROOT / "figures"
MPLCONFIGDIR = ROOT / ".matplotlib"

FIGURES_DIR.mkdir(exist_ok=True)
MPLCONFIGDIR.mkdir(exist_ok=True)
os.environ.setdefault("MPLCONFIGDIR", str(MPLCONFIGDIR))
