FROM golang:bullseye

RUN apt-get update && \
    apt-get upgrade && \
    apt-get install make git zlib1g-dev libssl-dev gperf php-cli cmake clang libc++-dev libc++abi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN git clone https://github.com/tdlib/td.git &&\
    cd td &&\
    git checkout daf4801 &&\
    mkdir build && cd build && \
    CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang CXX=/usr/bin/clang++ cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. && \
    cmake --build . --target install -j6 && \
    rm -rf /td

WORKDIR $GOPATH
