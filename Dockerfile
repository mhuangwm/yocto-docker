FROM ubuntu:20.04

ENV TZ=America/Toronto
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm locales tzdata cpio
RUN apt-get install -y gawk \
    wget \
    git \
    diffstat \
    unzip \
    texinfo \
    gcc \
    build-essential \
    chrpath \
    socat \
    cpio \
    python3 \
    python3-pip \
    python3-pexpect \
    xz-utils \
    debianutils \
    iputils-ping \
    python3-git \
    python3-jinja2 \
    libegl1-mesa \
    libsdl1.2-dev \
    pylint3 \
    xterm \
    python3-subunit \
    mesa-common-dev \
    locales \
    tzdata

ARG host_uid=1000
ARG host_gid=1000
RUN groupadd -g $host_gid dev && \
    useradd -g $host_gid -m -s /bin/bash -u $host_uid dev \
    && chown -R dev:dev /home/dev

RUN locale-gen en_US.UTF-8
RUN locale-gen en_US.UTF-8

USER dev
WORKDIR /home/dev
