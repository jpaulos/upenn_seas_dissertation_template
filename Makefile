RUBBER=rubber -d

main:
	$(RUBBER) dissertation.tex

heading:
	$(RUBBER) --jobname tmp_heading --only heading dissertation.tex
	mv tmp_heading.pdf heading.pdf

introduction:
	$(RUBBER) --jobname tmp_introduction --only introduction dissertation.tex
	mv tmp_introduction.pdf introduction.pdf

one:
	$(RUBBER) --jobname tmp_one --only one dissertation.tex
	mv tmp_one.pdf one.pdf

two:
	$(RUBBER) --jobname tmp_two --only two dissertation.tex
	mv tmp_two.pdf two.pdf

conclusion:
	$(RUBBER) --jobname tmp_conclusion --only conclusion dissertation.tex
	mv tmp_conclusion.pdf conclusion.pdf

appendix:
	$(RUBBER) --jobname tmp_appendix --only alpha,beta dissertation.tex
	mv tmp_appendix.pdf appendix.pdf

all: main introduction one two conclusion appendix

tidy:
	$(RUBBER) --clean dissertation.tex
	rm -f *.aux *.log *.blg *.lot *.lof *.bbl *.toc *.out *~

clean: tidy
	rm -f *.pdf *.dvi