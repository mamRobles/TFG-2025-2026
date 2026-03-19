DOC := main.tex

all: doc

doc: $(DOC:.tex=.pdf)

all: main.pdf

%.pdf: %.tex FORCE
	pdflatex $< && biber $* && pdflatex $< && pdflatex $<

FORCE: 


