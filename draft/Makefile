TYPST := typst
PYTHON := python3
MAIN := main.typ
PDF := main.pdf
HTML := main.html
HOST := 127.0.0.1
PORT := 9955
CHAPTERS := $(wildcard chapters/*.typ)
STYLE := thesis.typ
FONTS := $(wildcard fonts/*)
TYPST_FLAGS := --root . --font-path fonts --ignore-system-fonts

.PHONY: all watch webwatch htmlwatch clean

all: $(PDF)

$(PDF): $(MAIN) $(STYLE) $(CHAPTERS) refs.bib $(FONTS)
	$(TYPST) compile $(TYPST_FLAGS) $(MAIN) $(PDF)

watch:
	$(TYPST) watch $(TYPST_FLAGS) $(MAIN) $(PDF)

webwatch:
	$(PYTHON) scripts/pdf_webwatch.py --host $(HOST) --port $(PORT) --pdf $(PDF) --open -- $(TYPST) watch $(TYPST_FLAGS) $(MAIN) $(PDF)

htmlwatch:
	$(TYPST) watch $(TYPST_FLAGS) --features html --format html --port $(PORT) $(MAIN) $(HTML) --open

clean:
	rm -f $(PDF)
	rm -f $(HTML)
	rm -rf .typst
