QUARTO := quarto
PYTHON := python3
MAIN := main
QMD := $(MAIN).qmd
PDF := $(MAIN).pdf
VERIFY := verify_model_results.py
SECTIONS := $(wildcard sections/*.qmd)
AUX := $(MAIN).aux $(MAIN).bbl $(MAIN).bcf $(MAIN).blg $(MAIN).fdb_latexmk $(MAIN).fls $(MAIN).log $(MAIN).out $(MAIN).run.xml $(MAIN).tex $(MAIN).toc $(MAIN).xdv $(MAIN).synctex.gz

.PHONY: all pdf preview verify clean distclean rebuild

all: pdf

pdf: $(PDF)

rebuild: distclean pdf

$(PDF): $(QMD) $(SECTIONS) _quarto.yml preamble.tex refs.bib
	$(QUARTO) render $(QMD) --to pdf

preview:
	$(QUARTO) preview $(QMD) --to pdf

verify:
	$(PYTHON) $(VERIFY)

clean:
	rm -f $(AUX)

distclean: clean
	rm -f $(PDF)
