FILES = intro.md evacuation.md injury.md roles.md radio.md head-warden.md \
warden.md safety-officer.md judge.md linesman.md shepherd.md inspector.md \
batteries.md helpdesk.md reception.md duty-tech.md photographer.md locations.md

.PHONY: all clean

all: procedure.pdf

procedure.pdf: procedure.tex $(FILES:.md=.tex)
	pdflatex $<
	pdflatex $<

%.tex: %.md
	pandoc --from markdown --to latex --smart -o $@ $<

clean:
	rm -f procedure.pdf
	rm -f $(FILES:.md=.tex)
	rm -f $(FILES:.md=.aux)
	rm -f procedure.log
	rm -f procedure.out
	rm -f procedure.toc
	rm -f procedure.aux

