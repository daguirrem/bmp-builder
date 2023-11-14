#/bin/sh

export PATH="/opt/arm/arm-gnu-toolchain/bin:$PATH"

rm -f output/*
make -C repo $@ && cp repo/src/blackmagic* ./output
