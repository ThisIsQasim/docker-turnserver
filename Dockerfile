#FROM phusion/baseimage:0.9.18
FROM debian:stretch-slim
MAINTAINER Brian Prodoehl <bprodoehl@connectify.me>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y gdebi-core curl

ENV COTURN_VER 4.4.5.3
RUN cd /tmp/ && curl -sL http://turnserver.open-sys.org/downloads/v${COTURN_VER}/turnserver-${COTURN_VER}-debian-wheezy-ubuntu-mint-x86-64bits.tar.gz | tar -xzv

RUN groupadd turnserver
RUN useradd -g turnserver turnserver
RUN echo "deb http://ftp.de.debian.org/debian jessie main" >> /etc/apt/sources.list.d/backports.list && \
    apt update
RUN gdebi -n /tmp/coturn*.deb

# Clean up APT when done.
RUN rm /etc/apt/sources.list.d/backports.list && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /usr/bin/turnserver --no-cli 
