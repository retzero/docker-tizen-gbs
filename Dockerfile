FROM ubuntu:xenial

MAINTAINER Hyokeun Jeon <hyokeun@gmail.com>

# Install gbs
RUN echo "deb [trusted=yes] http://download.tizen.org/tools/archive/18.01.4/Ubuntu_16.04/ /" >> /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y --force-yes wget gbs

# Binfmt configuration
RUN sed -i "2a\\find /proc/sys/fs/binfmt_misc/ -name \"qemu-*\" -type f -exec sh -c \"echo -1 | tee {}\" \\\;" /usr/local/bin/dockerd-entrypoint.sh

