FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

RUN apk add --no-cache --update alpine-sdk linux-headers openssl-dev zlib-dev cmake gperf git
WORKDIR /
RUN git clone https://github.com/tdlib/td.git
WORKDIR /td
RUN git checkout v1.8.0
WORKDIR /td/build
RUN cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
RUN cmake --build . --target install
RUN apk del cmake gperf git

WORKDIR /data
RUN rm -rf /td