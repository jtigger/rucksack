#!/usr/bin/env bash

HEADSET_NAME="Jabra Elite 85h"

# [{"address":"70-bf-92-37-64-64","recentAccessDate":"2026-03-11T06:17:16-07:00","favourite":false,"name":"Jabra Elite 85h","connected":false,"paired":true}]
device_id=$(blueutil --paired --format json \
  | jq -r '.[] | select(.name == "Jabra Elite 85h") | .address'
)

# [{"address":"70-bf-92-37-64-64","recentAccessDate":"2026-03-11T18:40:05-07:00","paired":true,"RSSI":-51,"rawRSSI":-51,"favourite":false,"connected":true,"name":"Jabra Elite 85h","slave":false}]
connected=$(blueutil --format json --connected | jq -r '.[] | select(.address == "'$device_id'") | .connected')
[[ $connected == "true" ]] && blueutil --disconnect ${device_id}
blueutil --power 0

pmset sleepnow

read -r -p "Reconnect ${HEADSET_NAME}? [y/N] " response
if [[ "$response" =~ ^[Yy]$ ]]; then
  blueutil --power 1
  blueutil --connect ${device_id}
fi
