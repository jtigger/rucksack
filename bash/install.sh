#!/usr/bin/env bash
export POCKET="bash"

cd ~
source rucksack/_core.sh

abort_if_pocket_installed
log "'${POCKET}' pocket installing..."
add_to_installed_pockets_list

brew_install tree
brew_install kr
brew_install jq
brew_install bash-completion
brew_install brew-cask-completion

unpack_file rucksack/bash/.bash_profile.example .bash_profile
unpack_file rucksack/bash/.bashrc.example .bashrc

mv_to_bak .inputrc
ln_to rucksack/bash/.inputrc .inputrc

