.PHONY: build clean

build:
	pdflatex -interaction=nonstopmode main.tex
	bibtex main
	pdflatex -interaction=nonstopmode main.tex
	pdflatex -interaction=nonstopmode main.tex

clean:
	rm -f main.pdf main.aux main.bbl main.blg main.log main.out main.run.xml *.fls *.fdb_latexmk
