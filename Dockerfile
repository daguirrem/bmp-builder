FROM debian:stable-slim

# Download all depencece (git, make, curl, xz, python3, arm-none-eabi 12.2) 
RUN apt-get update && \
    apt-get install -y git make tar curl xz-utils python3 pip && \
    curl -o /tmp/arm-gnu-toolchain.tar.xz https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz && \
    mkdir -p /opt/arm && tar -xf /tmp/arm-gnu-toolchain.tar.xz -C /opt/arm && \
    mv /opt/arm/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi /opt/arm/arm-gnu-toolchain

# BMP VERSION TAG E.g. v1.10.0
ARG BMP_VERSION="v1.10.0"

# Get lastest release BlackMagic Repo
RUN mkdir -p /root/blackmagic/repo && mkdir -p /root/blackmagic/output && \
    git clone https://github.com/blackmagic-debug/blackmagic --depth 1 \
        --branch $BMP_VERSION /root/blackmagic/repo && \
    cd /root/blackmagic/repo && git submodule update --init

WORKDIR /root/blackmagic

# To make the firmware:
COPY build.sh .
RUN chmod +x build.sh

ENTRYPOINT ["sh", "/root/blackmagic/build.sh"]