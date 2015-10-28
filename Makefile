IMAGES = images/arbitrary-access.pdf \
    images/divergence-analysis.pdf \
    images/F-vs-VFn.pdf \
    images/horizontal-vectorization.pdf \
    images/if-cfg.pdf \
    images/interleaved-access.pdf \
    images/linearization-overview.pdf \
    images/loop-example1.pdf \
    images/loop-linear-cfg.pdf \
    images/loop-linearization1.pdf \
    images/loop-linearization2.pdf \
    images/loop-linearization3.pdf \
    images/mask-generation.pdf \
    images/packetization-1.pdf \
    images/packetization-2.pdf \
    images/packetization-3.pdf \
    images/packetization-4.pdf \
    images/phi-packetization.pdf \
    images/scalarization-end.pdf \
    images/scalarization-start.pdf \
    images/sequential-access.pdf \
    images/stages-control-flow.pdf \
    images/stages-packet.pdf \
    images/stages.pdf \
    images/stages-scalar.pdf \
    images/uniform-access.pdf \
    images/uva-example-end.pdf \
    images/uva-example-interm.pdf \
    images/uva-example-start.pdf \
    images/vertical-vectorization.pdf \
    images/work-items.pdf \
    images/load-addressing.pdf

all: Slides-slatebg.pdf Slides-blackbg.pdf

Slides-blackbg.tex: Slides.tex
	cat $< | grep -v '%\\def \\colourscheme' | perl -pe 's/\\def \\colourscheme \{(.*)\}/\\def \\colourscheme {colours-dark-background}/' > $@

Slides-slatebg.pdf: $(IMAGES) Slides.tex
	xelatex Slides.tex
	xelatex Slides.tex
	cp Slides.pdf Slides-slatebg.pdf

Slides-blackbg.pdf: $(IMAGES) Slides-blackbg.tex
	xelatex Slides-blackbg.tex
	xelatex Slides-blackbg.tex

%.pdf: %.svg
	inkscape $< --export-pdf=$@

clean:
	rm -f *.aux *.toc *.vrb *.snm Slides-slatebg.pdf Slides-blackbg.pdf
