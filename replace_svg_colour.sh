IMAGES="images/arbitrary-access.svg \
    images/divergence-analysis.svg \
    images/F-vs-VFn.svg \
    images/horizontal-vectorization.svg \
    images/if-cfg.svg \
    images/interleaved-access.svg \
    images/linearization-overview.svg \
    images/loop-example1.svg \
    images/loop-linear-cfg.svg \
    images/loop-linearization1.svg \
    images/loop-linearization2.svg \
    images/loop-linearization3.svg \
    images/mask-generation.svg \
    images/packetization-1.svg \
    images/packetization-2.svg \
    images/packetization-3.svg \
    images/packetization-4.svg \
    images/phi-packetization.svg \
    images/scalarization-end.svg \
    images/scalarization-start.svg \
    images/sequential-access.svg \
    images/stages-control-flow.svg \
    images/stages-packet.svg \
    images/stages.svg \
    images/stages-scalar.svg \
    images/uniform-access.svg \
    images/uva-example-end.svg \
    images/uva-example-interm.svg \
    images/uva-example-start.svg \
    images/vertical-vectorization.svg \
    images/work-items.svg"

for IMAGE in $IMAGES
do
    sed -i "s/#$1/#$2/g" $IMAGE
done
