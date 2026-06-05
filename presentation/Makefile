TEX        := thesis-bm
SRCFIG     := ../draft/figures
FIGDIR     := figures

.PHONY: all pdf watch clean

all: pdf

pdf:
	latexmk -xelatex $(TEX)

watch:
	latexmk -xelatex -pvc $(TEX)

clean:
	latexmk -c $(TEX)
