FROM eclipse-temurin:17-jre-alpine

ENV RELEASE_VERSION=0.3.9

RUN mkdir -p /app && \
  curl -L https://github.com/jagrosh/MusicBot/releases/download/${RELEASE_VERSION}/JMusicBot-${RELEASE_VERSION}.jar -o /app/JMusicBot.jar && \
  chown -R 1000:1000 /app

ADD --chown=1000:1000 entrypoint.sh /app/entrypoint.sh

WORKDIR /app

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]