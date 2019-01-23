FROM ubuntu:xenial

MAINTAINER Hyokeun Jeon <hyokeun@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# Install gbs
RUN echo "deb [trusted=yes] http://download.tizen.org/tools/archive/18.01.4/Ubuntu_16.04/ /" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y --force-yes gbs

RUN apt-get -y install vim wget

RUN /usr/sbin/update-binfmts --disable
RUN systemctl disable binfmt-support.service

WORKDIR /opt/repo/
