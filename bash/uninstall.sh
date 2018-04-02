#!/usr/bin/env bash

cd ~
source rucksack/_core.sh

log "bash:"

mv_to_cruft .bashrc
mv_from_bak .bashrc

mv_to_cruft .bash_profile
mv_from_bak .bash_profile

brew_uninstall tree
