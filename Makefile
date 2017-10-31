TARGET=homework

all: $(TARGET).pdf

## Generalized rule: how to build a .pdf from each .tex
%.pdf: %.tex $(TARGET).cls
	pdflatex -interaction nonstopmode $<

touch:
	touch *.tex

again: touch all

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb || true

veryclean: clean
	rm -f $(TARGET).pdf

view: $(TARGET).pdf
	if [ "Darwin" = "$(shell uname)" ]; then open $(TARGET).pdf ; else zathura $(TARGET).pdf ; fi

submit: $(TARGET).pdf
	cp $(TARGET).pdf ../

print: $(TARGET).pdf
	lpr $(TARGET).pdf

install:
	cp homework.cls ${HOME}/$(kpsewich -var-value=TEXMFHOME)/texmf/tex/latex/homework.cls

.PHONY: all again touch clean veryclean view print
