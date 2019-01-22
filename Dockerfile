FROM phusion/baseimage:0.11

WORKDIR /opt
COPY build_qemu.sh /opt/build_qemu.sh
ENV PATH="/opt/qemu-targets:${PATH}"

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
        wget \
    && ./build_qemu.sh "qemu-3.1.0" \
    && apt-get remove -y \
        automake \
        bison \
        build-essential \
        cmake \
        flex \
        gcc \
        gdb \
        git \
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
        wget \
    && apt-get autoremove -y \
    && apt-get clean -y
