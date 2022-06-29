FROM ubuntu:bionic

RUN apt update && apt install -y \
 build-essential \
 debhelper \
 devscripts \
 dh-systemd \
 equivs \
 git \
 libcrypto++-dev \
 libssl1.0-dev \
 uml-utilities \
 wget \
 zlib1g-dev && mkdir /mnt/build

COPY entrypoint.sh /opt/

WORKDIR /mnt/build

RUN chmod +x /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
