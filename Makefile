# rubber command and options
RUBBER=rubber
OPTS=--pdf

# choose heading or heading_proposal
HEADING=heading_proposal

main:
	$(RUBBER) $(OPTS) dissertation.tex

heading:
	$(RUBBER) $(OPTS) --jobname tmp_$(HEADING) --only $(HEADING) dissertation.tex
	mv tmp_$(HEADING).pdf $(HEADING).pdf

introduction:
	$(RUBBER) $(OPTS) --jobname tmp_introduction --only introduction dissertation.tex
	mv tmp_introduction.pdf introduction.pdf

one:
	$(RUBBER) $(OPTS) --jobname tmp_one --only one dissertation.tex
	mv tmp_one.pdf one.pdf

two:
	$(RUBBER) $(OPTS) --jobname tmp_two --only two dissertation.tex
	mv tmp_two.pdf two.pdf

conclusion:
	$(RUBBER) $(OPTS) --jobname tmp_conclusion --only conclusion dissertation.tex
	mv tmp_conclusion.pdf conclusion.pdf

appendix:
	$(RUBBER) $(OPTS) --jobname tmp_appendix --only alpha,beta dissertation.tex
	mv tmp_appendix.pdf appendix.pdf

# make all targets into separate pdfs
all: main heading introduction one two conclusion appendix

# remove temporary files, keeping final output pdf
tidy:
	$(RUBBER) --clean dissertation.tex
	rm -f *.aux *.log *.blg *.lot *.lof *.bbl *.toc *.out *~

# removal all generated files, including the final output pdf
clean:
	$(RUBBER) $(OPTS) --clean dissertation.tex
	rm -f *.pdf *.dvi