#!/bin/sh

ENDPOINT=${1:-"http://192.168.49.2:31602/"}

while true; do
    printf "%s >>>>> status: %s\n" "$(date)" "$(curl "$ENDPOINT" -I -o /dev/null -w '%{http_code}' -s)"
    sleep 1
done
