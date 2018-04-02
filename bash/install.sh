#!/usr/bin/env bash

cd ~
source rucksack/_core.sh

log "bash:"

brew_install tree

unpack_file rucksack/bash/.bash_profile.example .bash_profile
unpack_file rucksack/bash/.bashrc.example .bashrc

