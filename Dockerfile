FROM amazoncorretto:25-alpine

ENV JAVA_OPTIONS=""

RUN addgroup -g 1000 -S burp && \
  adduser -u 1000 -S burp -G burp
RUN mkdir -p /app && \
  chown burp:burp /app && \
  mkdir -p /config && \
  chown burp:burp /config

USER burp

ADD --chown=burp:burp https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar /app/burp.jar
COPY --chown=burp:burp entrypoint.sh /app/entrypoint.sh

EXPOSE 53/udp
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 25/tcp
EXPOSE 587/tcp
EXPOSE 465/tcp

ENTRYPOINT [ "/app/entrypoint.sh" ]
