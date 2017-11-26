FROM ubuntu:16.04

LABEL MAINTAINER=octowhale@github

ENV SHADOWSOCKSR https://github.com/shadowsocksr-backup/shadowsocksr.git

RUN apt update \
    && apt install -y --no-install-recommends python    \
    && rm -rf /var/lib/apt/lists/*  

RUN apt update \
    && apt install -y git    \
    && git clone $SHADOWSOCKSR      \
    && cd shadowsocksr && git checkout manyuser     \
    && rm -rf .git      \
    && apt purge -y --auto-remove git      \
    && apt autoremove    \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh"]
