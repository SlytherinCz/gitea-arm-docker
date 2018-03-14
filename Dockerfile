FROM armhf/alpine:3.5

ENV USER gitea
ENV GITEA_CUSTOM /data/gitea

RUN apk update && \
  apk add bash ca-certificates sqlite git openssh wget && \
  adduser -S -D -H gitea

RUN mkdir -p /usr/bin/gitea && \
    wget -O /usr/bin/gitea/gitea https://dl.gitea.io/gitea/1.4/gitea-1.4-linux-arm-7 && \
    chmod +x /usr/bin/gitea/gitea && \
    chown gitea /usr/bin/gitea/gitea

EXPOSE 22 3000

ENTRYPOINT ["/usr/bin/gitea/gitea","web"]
