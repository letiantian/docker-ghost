FROM ubuntu:14.04

ENV NODE_VERSION 0.12.9

RUN \
    apt-get update && \
    apt-get install -y curl zip

RUN \
    cd /tmp && \
    curl -SLO "https://nodejs.org/dist/v0.12.9/node-v$NODE_VERSION-linux-x64.tar.gz"  && \
    tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1

ADD Ghost-0.7.0-zh-full.zip /tmp/Ghost-0.7.0-zh-full.zip

RUN \
    unzip /tmp/Ghost-0.7.0-zh-full.zip -d /ghost && \
    rm /tmp/Ghost-0.7.0-zh-full.zip && \
    cd /ghost && \
    sed 's/127.0.0.1/0.0.0.0/' config.example.js > config.js


VOLUME /ghost-external

WORKDIR /ghost

EXPOSE 2368

ADD start.sh /start-ghost.sh
RUN chmod +x /start-ghost.sh

CMD ["/start-ghost.sh"]