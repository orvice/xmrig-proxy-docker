FROM debian:11

RUN apt update -y && apt install -y git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev

WORKDIR /app

RUN https://github.com/xmrig/xmrig.git
RUN mkdir xmrig/build
WORKDIR /app/xmrig/build
RUN cmake ..
RUN make -j$(nproc)