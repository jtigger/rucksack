#!/usr/bin/env bash

cd ~
source rucksack/_core.sh

log "git:"

mv_to_bak .gitconfig
ln_to rucksack/git/.gitconfig .
 
mv_to_bak .gitconfig-grep
ln_to rucksack/git/.gitconfig-grep .

