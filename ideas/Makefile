QUARTO := quarto
PYTHON := poetry run python
EN_QMD := en/main.qmd
ZH_QMD := zh/main.qmd
EN_PDF := en/main.pdf
ZH_PDF := zh/main.pdf
VERIFY := scripts/verify_model_results.py
FIGURES := figures/binary_timing_regions.png figures/labor_payoff_comparison.png
SECTIONS_EN := $(wildcard en/sections/*.qmd)
SECTIONS_ZH := $(wildcard zh/sections/*.qmd)
AUX := \
	en/main.aux en/main.bbl en/main.bcf en/main.blg en/main.fdb_latexmk en/main.fls en/main.log en/main.out en/main.run.xml en/main.tex en/main.toc en/main.xdv en/main.synctex.gz \
	zh/main.aux zh/main.bbl zh/main.bcf zh/main.blg zh/main.fdb_latexmk zh/main.fls zh/main.log zh/main.out zh/main.run.xml zh/main.tex zh/main.toc zh/main.xdv zh/main.synctex.gz

.PHONY: all pdf preview verify figures clean distclean rebuild

all: pdf

pdf: figures $(EN_PDF) $(ZH_PDF)

rebuild: distclean pdf

$(EN_PDF): $(EN_QMD) $(SECTIONS_EN) _quarto.yml en/preamble.tex refs.bib $(FIGURES)
	$(QUARTO) render $(EN_QMD) --to pdf

$(ZH_PDF): $(ZH_QMD) $(SECTIONS_ZH) _quarto.yml zh/preamble.tex refs.bib $(FIGURES)
	$(QUARTO) render $(ZH_QMD) --to pdf

figures: $(FIGURES)

$(FIGURES): scripts/generate_figures.py
	$(PYTHON) scripts/generate_figures.py

preview:
	$(QUARTO) preview $(EN_QMD) --to pdf

verify:
	$(PYTHON) $(VERIFY)

clean:
	rm -f $(AUX)

distclean: clean
	rm -f $(EN_PDF) $(ZH_PDF) main.pdf
