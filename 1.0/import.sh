#!/bin/bash

function f_find {
    find "$STORAGE_DIRECTORY" -type f -name "*.sql" -o -name "*.sql.gz"
}

targetfile=""
while [ ! -f "$targetfile" ] ; do
    count=0
    f_find | while read curfile ; do
        let count++
        printf "%03s %s\n" $count $(basename "$curfile")
    done

    selection=""
    while [ "$selection" == "" ] ; do
        read -p "Which one to import?: " selection
        if [[ "$selection" =~ ^[0-9]+$ ]] ; then
            targetfile=$(f_find | head -n $selection | tail -n 1)
        else
            selection=""
        fi
    done
done

while [ 1 == 1 ] ; do
    read -p "This will import $targetfile. Proceed? (y/n): " answer
    if [[ "$answer" =~ ^[YyNn]$ ]] ; then
        answer=$(tr '[:upper:]' '[:lower:]' <<< "$answer")
        if [ "$answer" == "y" ] ; then
            if [[ "$targetfile" =~ \.gz$ ]] ; then
                gunzip -c "$targetfile" | mysql $MYSQL_CLI_ARGS
            else
                mysql $MYSQL_CLI_ARGS < "$targetfile"
            fi
        fi
        break
    fi
done
