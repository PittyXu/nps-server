FROM alpine:latest
MAINTAINER pitty <pitty.xu@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.26.5

RUN set -x && \
    mkdir /nps && \
    cd /nps && \
    wget --no-check-certificate https://github.com/ehang-io/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz && \ 
    tar xzf linux_amd64_server.tar.gz && \
    chmod +x nps && \
    ./nps install && \
    rm -rf *.tar.gz

VOLUME /nps/conf

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 8024

CMD /nps/nps start
