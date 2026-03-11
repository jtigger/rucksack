#!/usr/bin/env bash

set -xe

HEADSET_NAME="Jabra Elite 85h"

# address: 70-bf-92-37-64-64, not connected, not favourite, paired, name: "Jabra Elite 85h", recent access date: 2026-03-11 02:24:38 +0000
device_id=$(blueutil --paired \
  | grep "${HEADSET_NAME}" \
  | awk -F, '{ print $1 }' \
  | awk -F: '{ print $2 }'
)

blueutil --disconnect ${device_id}
blueutil --power 0
pmset sleepnow
sleep 5
blueutil --power 1
blueutil --connect ${device_id}


