#!/usr/bin/env bash

HEADSET_NAME="Jabra Elite 85h"

# [{"address":"70-bf-92-37-64-64","recentAccessDate":"2026-03-11T06:17:16-07:00","favourite":false,"name":"Jabra Elite 85h","connected":false,"paired":true}]
device_id=$(blueutil --paired --format json \
  | jq -r '.[] | select(.name == "Jabra Elite 85h") | .address'
)

echo $device_id

blueutil --disconnect ${device_id}
blueutil --power 0
pmset sleepnow

blueutil --power 1

read -r -p "Reconnect ${HEADSET_NAME}? [y/N] " response
if [[ "$response" =~ ^[Yy]$ ]]; then
  blueutil --connect ${device_id}
fi


