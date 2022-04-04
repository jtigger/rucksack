#!/usr/bin/env bash

set -euf -o pipefail
#set -x

if [[ $# -eq 0 ]]; then
  echo "Usage:"
  echo "  $0 [--path-only|-p] (slug)"
  exit 1
fi

opt_dl_file=true

while [[ $# -gt 0 ]]; do
  case "$1" in
    "--path-only" | "-p" )
      opt_dl_file=false
      ;;
    *)
      SLUG=$1
      ;;
  esac
  shift
done

PAGE_URL="https://dynamic.wakingup.com/moment/${SLUG}"
FILE="/Users/jtigger/Library/Mobile Documents/iCloud~dk~simonbs~Scriptable/Documents/scriptable-moz/catalog/media/${SLUG}.mp3"
FILE_URL="file://$(echo $FILE | sed 's/ /%20/g' )"

if [[ "$opt_dl_file" == true ]]; then
  # scrape from the JavaScript in the page, a JSON body containing the link to the MP3.
  AUDIO_URL=$( curl --silent ${PAGE_URL} | grep --only-matching '"audioUrl":"\(.*mp3\)"' | cat <(echo "{") - <(echo "}") | jq -r .audioUrl )

  curl $AUDIO_URL --output "$FILE"
fi

echo "$FILE_URL" | pbcopy

open /Applications/Things3.app

