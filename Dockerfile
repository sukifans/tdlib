FROM golang:alpine

RUN apk update
RUN apk upgrade

RUN apk add --update alpine-sdk linux-headers git zlib-dev gperf php cmake libressl-dev zlib-static
WORKDIR /
RUN git clone https://github.com/tdlib/td.git
WORKDIR /td
RUN git checkout v1.8.0
WORKDIR /td/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install -j 3
WORKDIR /
RUN rm -rf /td