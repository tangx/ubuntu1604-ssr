FROM ubuntu:16.04

LABEL MAINTAINER=octowhale@github

ENV SHADOWSOCKSR https://github.com/shadowsocksr-backup/shadowsocksr.git

# use cache
RUN apt update \
    && apt install -y --no-install-recommends python    \
    && rm -rf /var/lib/apt/lists/*  

# download shadowsocksr code
RUN apt update \
    && apt install -y git    \
    && git clone $SHADOWSOCKSR      \
    # switch to manyuser branch
    && cd shadowsocksr && git checkout manyuser     \
    && rm -rf .git      \
    && apt purge -y --auto-remove git      \
    && apt autoremove    \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh"]
EXPOSE 8388

CMD ["server.py"]