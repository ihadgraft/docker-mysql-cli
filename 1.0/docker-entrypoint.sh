#!/bin/sh

export MYSQL_CLI_ARGS="-h ${MYSQL_HOST} -P ${MYSQL_PORT} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}"

if [ ! -d "$STORAGE_DIRECTORY" ] ; then
    mkdir -p "$STORAGE_DIRECTORY"
fi

"$@"
