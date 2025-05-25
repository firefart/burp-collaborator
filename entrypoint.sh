#!/usr/bin/env sh

exec /usr/bin/java ${JAVA_OPTONS} -jar /app/burp.jar --collaborator-server --collaborator-config=/config/collaborator.config "$@"
