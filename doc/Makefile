DOC := main.tex

all: doc

doc: $(DOC:.tex=.pdf)

all: main.pdf

%.pdf: %.tex FORCE
	pdflatex $< && bibtex $* && pdflatex $< && pdflatex $<

FORCE: 


