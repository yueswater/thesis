TYPST := typst
PYTHON := ./.venv/bin/python
HOST := 127.0.0.1
PORT := 9955
FONTS_DIR := fonts
FIGURES_DIR := figures
TYPST_FLAGS := --root . --font-path $(FONTS_DIR) --ignore-system-fonts

LANGS := zh en
FIGURE_SCRIPTS := scripts/render_chapter5_figures.py scripts/render_chapter6_qs_regions.py
VERIFY_SCRIPTS := scripts/verify_binary_model.py scripts/verify_model_results.py

.PHONY: all clean watch webwatch figures verify pdf $(LANGS) $(addprefix watch-,$(LANGS)) $(addprefix webwatch-,$(LANGS))

all: figures $(LANGS)

pdf: zh

figures:
	$(PYTHON) scripts/render_chapter5_figures.py
	$(PYTHON) scripts/render_chapter6_qs_regions.py

verify:
	$(PYTHON) scripts/verify_binary_model.py
	$(PYTHON) scripts/verify_model_results.py

watch:
	@trap 'kill 0' INT TERM EXIT; \
	$(TYPST) watch $(TYPST_FLAGS) i18n/zh/main.typ i18n/zh/main.pdf & \
	$(TYPST) watch $(TYPST_FLAGS) i18n/en/main.typ i18n/en/main.pdf & \
	wait

# Template for each language
define LANG_template
$(1): i18n/$(1)/main.pdf

i18n/$(1)/main.pdf: figures i18n/$(1)/main.typ i18n/$(1)/thesis.typ i18n/$(1)/refs.bib $$(wildcard i18n/$(1)/chapters/*.typ) $$(wildcard $(FONTS_DIR)/*) $$(wildcard $(FIGURES_DIR)/*)
	$(TYPST) compile $(TYPST_FLAGS) i18n/$(1)/main.typ i18n/$(1)/main.pdf

watch-$(1):
	$(TYPST) watch $(TYPST_FLAGS) i18n/$(1)/main.typ i18n/$(1)/main.pdf

webwatch-$(1):
	$(PYTHON) scripts/pdf_webwatch.py --host $(HOST) --port $(PORT) --pdf i18n/$(1)/main.pdf --open -- $(TYPST) watch $(TYPST_FLAGS) i18n/$(1)/main.typ i18n/$(1)/main.pdf
endef

$(foreach lang,$(LANGS),$(eval $(call LANG_template,$(lang))))

clean:
	rm -f i18n/*/main.pdf
	rm -f i18n/*/main.html
	rm -rf .typst
