OUTDIR=build
MAIN=master.tex
MAINPDF=$(MAIN:.tex=.pdf)

default: $(MAINPDF)

distclean: clean
	-$(RM) *.pdf *.dvi *-blx.bib *.bbl *.run.xml *.synctex.gz *.log
	-$(RM) *.py.out *.py.err latex.py
	-$(RM) -R $(OUTDIR)
	-git clean -fx

clean:
	latexmk -C
	-$(RM) $(OUTDIR)/*.pdf $(OUTDIR)/*.synctex.gz
	-$(RM) *.pdf *.synctex.gz

%.pdf: %.tex
	latexmk -pdf -bibtex -synctex=1 -interaction=nonstopmode -outdir=$(OUTDIR) $<
	-cp -vlf $(OUTDIR)/$@ .
	-cp -vlf $(OUTDIR)/$(patsubst %.tex,%.synctex.gz,$<) .
