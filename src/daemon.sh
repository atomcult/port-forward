#!/bin/sh

local_ip="$(ip route get 8.8.8.8 | sed 's/.*src \([^ ]*\).*/\1/;t;d')"

while true; do
    socat TCP-LISTEN:5900,reuseaddr,bind="$local_ip" TCP:127.0.0.1:5900
    sleep 0.1
done
