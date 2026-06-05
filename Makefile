TYPST      := typst
PYTHON     := python/.venv/bin/python
HOST       := 127.0.0.1
PORT       := 9955

DRAFT_FLAGS := --root . --font-path docs/fonts --ignore-system-fonts

export PYTHONPATH = .

.PHONY: all draft presentation figures verify watch watch-presentation webwatch clean

all: figures draft presentation

draft: figures
	$(TYPST) compile $(DRAFT_FLAGS) docs/main.typ docs/main.pdf

presentation:
	cd presentation && latexmk -xelatex thesis-bm

figures:
	$(PYTHON) -m python.render.chapter5
	$(PYTHON) -m python.render.ch6_pooling
	$(PYTHON) -m python.render.ch6_spectrum

verify:
	$(PYTHON) -m python.verify.binary
	$(PYTHON) -m python.verify.results

watch:
	$(TYPST) watch $(DRAFT_FLAGS) docs/main.typ docs/main.pdf

watch-presentation:
	cd presentation && latexmk -xelatex -pvc thesis-bm

webwatch:
	$(PYTHON) python/pdf_webwatch.py --host $(HOST) --port $(PORT) --pdf docs/main.pdf --open -- \
		$(TYPST) watch $(DRAFT_FLAGS) docs/main.typ docs/main.pdf

clean:
	rm -f docs/main.pdf docs/main.html
	rm -rf docs/.typst
	cd presentation && latexmk -c thesis-bm
