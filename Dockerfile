FROM alpine:latest

RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

RUN apk add --no-cache gcc g++ openssl-dev zlib-dev cmake gperf
RUN apk del cmake gperf
