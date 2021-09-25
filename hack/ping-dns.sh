#! /usr/bin/env bash

PING="host -W 1 www.google.com"

while :; do
  echo "$( date -u +"%H:%M:%S" ) -- $( $PING | head -n 1 )"
done

