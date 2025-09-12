FROM curlimages/curl:8.16.0 AS downloader

ARG RELEASE_VERSION

USER 0
RUN echo ${RELEASE_VERSION}
RUN curl -L "https://github.com/jagrosh/MusicBot/releases/download/${RELEASE_VERSION}/JMusicBot-${RELEASE_VERSION}.jar" -o /tmp/JMusicBot.jar 

FROM eclipse-temurin:11.0.22_7-jre

RUN mkdir -p /app && chown -R 1000:1000 /app
COPY --chown=1000:1000 --from=downloader /tmp/JMusicBot.jar /app/JMusicBot.jar
ADD --chown=1000:1000 entrypoint.sh /app/entrypoint.sh

WORKDIR /app
USER 1000

ENTRYPOINT [ "/bin/sh", "entrypoint.sh" ]
