#!/bin/sh

name=$1
gamelist=$2

value=`xmlstarlet sel -t -v "//game[name=\"${name}\"]/favorite" "${gamelist}"`
if [ "${value}" = "true" ]; then
    echo "${name} is already marked as favorite"
    exit 0
fi
echo "Marking ${name} as a favorite"
xmlstarlet edit -L -P -s "//game[name=\"${name}\"]" -t elem -n favorite -v true "${gamelist}"
