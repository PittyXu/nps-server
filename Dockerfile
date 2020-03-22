FROM alpine:last
MAINTAINER pitty <pitty.xu@gmail.com>

WORKDIR /
ENV NPS_VERSION 0.26.5

RUN set -x && \
	wget --no-check-certificate https://github.com/ehang-io/nps/releases/download/v${NPS_VERSION}/linux_amd64_server.tar.gz && \ 
	tar xzf linux_amd64_server.tar.gz && \
	cd /nps && \
	mkdir \npsconf && \
	cp conf/* npsconf/ && \
  chmod +x nps && \
  ./nps install && \
	cd .. && \
	rm -rf *.tar.gz

VOLUME /nps/conf

EXPOSE 80
EXPOSE 443
EXPOSE 8080
EXPOSE 8024

CMD /nps/nps start
