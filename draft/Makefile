TYPST := typst
PYTHON := python3
HOST := 127.0.0.1
PORT := 9955
FONTS_DIR := fonts
FIGURES_DIR := figures
TYPST_FLAGS := --root . --font-path $(FONTS_DIR) --ignore-system-fonts

LANGS := zh en

.PHONY: all clean watch webwatch $(LANGS) $(addprefix watch-,$(LANGS)) $(addprefix webwatch-,$(LANGS))

all: $(LANGS)

watch:
	@trap 'kill 0' INT TERM EXIT; \
	$(TYPST) watch $(TYPST_FLAGS) i18n/zh/main.typ i18n/zh/main.pdf & \
	$(TYPST) watch $(TYPST_FLAGS) i18n/en/main.typ i18n/en/main.pdf & \
	wait

# Template for each language
define LANG_template
$(1): i18n/$(1)/main.pdf

i18n/$(1)/main.pdf: i18n/$(1)/main.typ i18n/$(1)/thesis.typ i18n/$(1)/refs.bib $$(wildcard i18n/$(1)/chapters/*.typ) $$(wildcard $(FONTS_DIR)/*) $$(wildcard $(FIGURES_DIR)/*)
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
