TYPST      := typst
PYTHON     := docs/.venv/bin/python
HOST       := 127.0.0.1
PORT       := 9955

DRAFT_FLAGS := --font-path docs/fonts --ignore-system-fonts

.PHONY: all draft presentation figures verify watch watch-presentation webwatch clean

all: figures draft presentation

draft: figures
	$(TYPST) compile $(DRAFT_FLAGS) docs/main.typ docs/main.pdf

presentation:
	cd presentation && latexmk -xelatex thesis-bm

figures:
	$(PYTHON) docs/scripts/render_chapter5_figures.py
	$(PYTHON) docs/scripts/render_chapter6_pooling_regions.py
	$(PYTHON) docs/scripts/render_chapter6_spectrum.py

verify:
	$(PYTHON) docs/scripts/verify_binary_model.py
	$(PYTHON) docs/scripts/verify_model_results.py

watch:
	$(TYPST) watch $(DRAFT_FLAGS) docs/main.typ docs/main.pdf

watch-presentation:
	cd presentation && latexmk -xelatex -pvc thesis-bm

webwatch:
	$(PYTHON) docs/scripts/pdf_webwatch.py --host $(HOST) --port $(PORT) --pdf docs/main.pdf --open -- \
		$(TYPST) watch $(DRAFT_FLAGS) docs/main.typ docs/main.pdf

clean:
	rm -f docs/main.pdf docs/main.html
	rm -rf docs/.typst
	cd presentation && latexmk -c thesis-bm
