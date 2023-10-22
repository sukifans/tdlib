FROM golang:alpine

RUN apk update &&\
    apk upgrade --no-cache &&\
    apk add --no-cache alpine-sdk linux-headers git zlib-dev gperf php cmake libressl-dev zlib-static ccache readline && \
    rm -rf /var/cache/apk/*

WORKDIR /

RUN git clone https://github.com/tdlib/td.git &&\
    cd td &&\
    git checkout daf4801 &&\
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. && \
    cmake --build . --target install -j6 && \
    rm -rf /td

WORKDIR /go
