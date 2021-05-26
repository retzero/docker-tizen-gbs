FROM ubuntu:bionic

MAINTAINER Hyokeun Jeon <hyokeun@gmail.com>

RUN echo "deb [trusted=yes] http://download.tizen.org/tools/latest-release/Ubuntu_18.04/ /" >> /etc/apt/sources.list

RUN apt update \
    && apt install -y --force-yes wget gbs zip unzip \
    && apt autoremove && apt clean && apt autoclean && apt autoclean \
    && rm -rf /var/cache/apt/archives

# Binfmt configuration
RUN find /proc/sys/fs/binfmt_misc/ -name "qemu-*" -type f -exec sh -c "echo -1 | tee {}" \;

ENTRYPOINT ["gbs"]
CMD ["--version"]
