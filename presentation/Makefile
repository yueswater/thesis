TEX        := thesis-bm
SRCFIG     := ../draft/figures
FIGDIR     := figures

# fig5_* are vector-heavy 3-panel matplotlib PDFs; latexmk's separate
# xdvipdfmx step desyncs on them, so we flatten them to image-PDFs and
# build with xelatex directly (PDF output in one process).
FLATTEN    := fig5_regions fig5_uniform_regions
COPYFIG    := fig6_qs_regions fig6_pooling_regions fig6_spectrum

XELATEX    := xelatex -interaction=nonstopmode -halt-on-error -file-line-error

.PHONY: all build figures clean distclean

all: build

figures:
	@mkdir -p $(FIGDIR)
	@for f in $(FLATTEN); do \
	  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfimage24 -r200 -dUseCropBox \
	     -o $(FIGDIR)/$$f.pdf $(SRCFIG)/$$f.pdf; \
	done
	@for f in $(COPYFIG); do cp $(SRCFIG)/$$f.pdf $(FIGDIR)/$$f.pdf; done

build: figures
	@rm -f $(TEX).aux $(TEX).bbl $(TEX).nav $(TEX).snm $(TEX).toc $(TEX).out
	$(XELATEX) $(TEX).tex
	-bibtex $(TEX)
	$(XELATEX) $(TEX).tex
	$(XELATEX) $(TEX).tex

clean:
	rm -f $(TEX).aux $(TEX).bbl $(TEX).blg $(TEX).log $(TEX).nav \
	      $(TEX).out $(TEX).snm $(TEX).toc $(TEX).vrb $(TEX).xdv \
	      $(TEX).fdb_latexmk $(TEX).fls

distclean: clean
	rm -f $(TEX).pdf
	rm -rf $(FIGDIR)
