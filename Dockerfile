FROM debian:11

RUN apt update -y && apt install -y git build-essential cmake libuv1-dev uuid-dev libmicrohttpd-dev libssl-dev libhwloc-dev

WORKDIR /app

RUN git clone https://github.com/xmrig/xmrig.git
RUN mkdir xmrig/build
WORKDIR /app/xmrig/build
RUN cmake ..
RUN make -j$(nproc)

ENTRYPOINT [ "/app/xmrig/build/xmrig-proxy" ]