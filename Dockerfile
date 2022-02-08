FROM golang:alpine

RUN apk update
RUN apk upgrade

RUN apk add --no-cache --update alpine-sdk linux-headers openssl-dev zlib-dev cmake gperf git
WORKDIR /
RUN git clone https://github.com/tdlib/td.git
WORKDIR /td
RUN git checkout v1.8.0
WORKDIR /td/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install -j 9
RUN apk del cmake gperf git
RUN rm -rf /td