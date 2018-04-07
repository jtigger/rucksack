#!/usr/bin/env bash

cd ~
source rucksack/_core.sh
init_state

log "- removing .rucksack-cruft files..."
find . -name "*.rucksack-cruft" | xargs rm -v
