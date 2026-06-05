TYPST := typst
PYTHON := ./.venv/bin/python
HOST := 127.0.0.1
PORT := 9955
FONTS_DIR := fonts
FIGURES_DIR := figures
TYPST_FLAGS := --root . --font-path $(FONTS_DIR) --ignore-system-fonts

FIGURE_SCRIPTS := scripts/render_chapter5_figures.py scripts/render_chapter6_qs_regions.py
VERIFY_SCRIPTS := scripts/verify_binary_model.py scripts/verify_model_results.py

.PHONY: all clean watch webwatch figures verify pdf

all: figures pdf

pdf: main.pdf

main.pdf: figures main.typ thesis.typ refs.bib $(wildcard chapters/*.typ) $(wildcard $(FONTS_DIR)/*) $(wildcard $(FIGURES_DIR)/*)
	$(TYPST) compile $(TYPST_FLAGS) main.typ main.pdf

figures:
	$(PYTHON) scripts/render_chapter5_figures.py
	$(PYTHON) scripts/render_chapter6_pooling_regions.py
	$(PYTHON) scripts/render_chapter6_spectrum.py

verify:
	$(PYTHON) scripts/verify_binary_model.py
	$(PYTHON) scripts/verify_model_results.py

watch:
	$(TYPST) watch $(TYPST_FLAGS) main.typ main.pdf

webwatch:
	$(PYTHON) scripts/pdf_webwatch.py --host $(HOST) --port $(PORT) --pdf main.pdf --open -- $(TYPST) watch $(TYPST_FLAGS) main.typ main.pdf

clean:
	rm -f main.pdf
	rm -f main.html
	rm -rf .typst
