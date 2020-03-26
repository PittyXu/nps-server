FROM alpine:latest
MAINTAINER pitty <pitty.xu@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.26.5

RUN set -x && \
    wget --no-check-certificate https://github.com/ehang-io/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz && \ 
    mkdir /nps && \
    tar xzf linux_amd64_server.tar.gz -C /nps && \
    /nps/nps install && \
    rm -rf linux_amd64_server.tar.gz

CMD ["/nps/nps"]
