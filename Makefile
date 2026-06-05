TYPST      := typst
PYTHON     := draft/.venv/bin/python
HOST       := 127.0.0.1
PORT       := 9955

DRAFT_FLAGS := --font-path draft/fonts --ignore-system-fonts

.PHONY: all draft presentation figures verify watch watch-presentation webwatch clean

all: figures draft presentation

draft: figures
	$(TYPST) compile $(DRAFT_FLAGS) draft/main.typ draft/main.pdf

presentation:
	cd presentation && latexmk -xelatex thesis-bm

figures:
	$(PYTHON) draft/scripts/render_chapter5_figures.py
	$(PYTHON) draft/scripts/render_chapter6_pooling_regions.py
	$(PYTHON) draft/scripts/render_chapter6_spectrum.py

verify:
	$(PYTHON) draft/scripts/verify_binary_model.py
	$(PYTHON) draft/scripts/verify_model_results.py

watch:
	$(TYPST) watch $(DRAFT_FLAGS) draft/main.typ draft/main.pdf

watch-presentation:
	cd presentation && latexmk -xelatex -pvc thesis-bm

webwatch:
	$(PYTHON) draft/scripts/pdf_webwatch.py --host $(HOST) --port $(PORT) --pdf draft/main.pdf --open -- \
		$(TYPST) watch $(DRAFT_FLAGS) draft/main.typ draft/main.pdf

clean:
	rm -f draft/main.pdf draft/main.html
	rm -rf draft/.typst
	cd presentation && latexmk -c thesis-bm
