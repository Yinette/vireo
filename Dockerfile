FROM ubuntu:18.04

RUN mkdir /opt/vireo
WORKDIR /opt/vireo

RUN apt-get update && apt-get -y install autoconf automake build-essential pkg-config git
RUN apt-get -y install libpng-dev libjpeg-dev libfdk-aac-dev libvpx-dev libogg-dev libvorbis-dev libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libx264-dev \
    && export TERM=xterm \
    && git clone https://github.com/Yinette/vireo.git \
    && git clone https://github.com/l-smash/l-smash.git \
    && cd l-smash && git fetch --all --tags --prune && git checkout tags/v2.9.1 && ./configure --enable-shared && make && make install && ldconfig \
    && cd ../vireo/vireo && export PREFIX=/usr/local/ && ./configure --prefix=$PREFIX && make && make install

