#!/usr/bin/env bash

cd ~
source rucksack/_core.sh

log "git:"

rm_link .gitconfig-grep
mv_from_bak .gitconfig-grep

rm_link .gitconfig
mv_from_bak .gitconfig
