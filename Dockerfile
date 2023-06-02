ARG RELEASE_VERSION

FROM curlimages/curl:8.1.1 AS downloader

USER 0
RUN mkdir -p /out && \
  curl -L https://github.com/jagrosh/MusicBot/releases/download/${RELEASE_VERSION}/JMusicBot-${RELEASE_VERSION}.jar -o /out/JMusicBot.jar 

FROM eclipse-temurin:17.0.7_7-jre-alpine

RUN mkdir -p /app && chown -R 1000:1000 /app
COPY --chown=1000:1000 --from=downloader /out/JMusicBot.jar /app/JMusicBot.jar
ADD --chown=1000:1000 entrypoint.sh /app/entrypoint.sh

WORKDIR /app
USER 1000

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]