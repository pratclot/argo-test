#!/bin/sh

# `curl` command borrowed from https://superuser.com/a/1176569/1276559
# `colors` from https://stackoverflow.com/a/20983251/13442292
#
# The script accepts 1 argument which will be used as a healthcheck endpoint.

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)
ENDPOINT=${1:-"http://192.168.49.2:31602/"}

while true; do
    CODE=$(curl "$ENDPOINT" -I -o /dev/null -w '%{http_code}' -s)
    if [ "$CODE" = "200" ]; then
        RESULT="$GREEN$CODE$RESET"
    else
        RESULT="$RED$CODE$RESET"
    fi
    printf "%s >>>>> status: %s\n" "$(date)" "$RESULT"
    sleep 1
done
