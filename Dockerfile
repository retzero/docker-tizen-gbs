FROM ubuntu:xenial

MAINTAINER Hyokeun Jeon <hyokeun@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive \
    TERM=xterm

# Install gbs
RUN echo "deb [trusted=yes] http://download.tizen.org/tools/archive/18.01.4/Ubuntu_16.04/ /" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y --force-yes gbs

RUN apt-get -y install vim wget

# Binfmt configuration
RUN sed -i "2a\\find /proc/sys/fs/binfmt_misc/ -name \"qemu-*\" -type f -exec sh -c \"echo -1 | tee {}\" \\\;" /usr/local/bin/dockerd-entrypoint.sh

WORKDIR /opt/repo/
