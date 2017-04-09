#!/bin/sh

if [ ! -z "$1" ] ; then
    label="$1"
else
    label="mysqldump"
fi


mysqldump $MYSQL_CLI_ARGS | gzip > "$STORAGE_DIRECTORY"/"$label"-$(date +${DATESTAMP_FORMAT}).sql.gz
