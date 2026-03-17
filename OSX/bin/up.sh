#!/usr/bin/env bash

HEADSET_NAME="Jabra Elite 85h"

# [{"address":"70-bf-92-37-64-64","recentAccessDate":"2026-03-11T06:17:16-07:00","favourite":false,"name":"Jabra Elite 85h","connected":false,"paired":true}]
device_id=$(blueutil --paired --format json \
  | jq -r '.[] | select(.name == "Jabra Elite 85h") | .address'
)

blueutil --power 1
blueutil --connect ${device_id}
