#!/usr/bin/env bash
if [[ "$1" != "" ]]; then
  DESIRED_VOLUME=$1
else
  DESIRED_VOLUME=$(osascript -e "input volume of (get volume settings)")
fi
echo "Affixing input volume to: $DESIRED_VOLUME."

while true; do
   osascript -e "set volume input volume $DESIRED_VOLUME"
   sleep 0.1
done
