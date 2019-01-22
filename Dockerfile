FROM phusion/baseimage:0.11 as builder

WORKDIR /opt
COPY build_qemu.sh /opt/build_qemu.sh

RUN install_clean \
        automake \
        bison \
        build-essential \
        cmake \
        flex \
        gcc \
        gdb \
        git \
        libglib2.0 \
        libpixman-1-dev \
        libssl-dev \
        libtool-bin \
        make \
        nettle-dev \
        python \
        python3 \
        python3-dev \
        python3-setuptools \
        screen \
        wget
RUN ./build_qemu.sh "qemu-3.1.0"


FROM phusion/baseimage:0.11

COPY --from=builder /opt/qemu-targets /opt/qemu-targets
ENV PATH="/opt/qemu-targets:${PATH}"
