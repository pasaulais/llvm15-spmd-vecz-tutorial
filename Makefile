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
    images/work-items.pdf

all: $(IMAGES)

%.pdf: %.svg
	inkscape $< --export-pdf=$@

