#!/usr/bin/env bash
POCKET_NAME="bash"

cd ~
source rucksack/_core.sh

abort_if_pocket_installed ${POCKET_NAME}
log "'${POCKET_NAME}' pocket installing..."

brew_install tree

unpack_file rucksack/bash/.bash_profile.example .bash_profile
unpack_file rucksack/bash/.bashrc.example .bashrc

add_to_installed_pockets_list ${POCKET_NAME}

