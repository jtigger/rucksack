#!/usr/bin/env bash
export POCKET="java"

cd ~
source rucksack/_core.sh

abort_if_pocket_installed
log "'${POCKET}' pocket installing..."
add_to_installed_pockets_list

# brew_cask_install java8
brew_cask_install font-dejavusansmono-nerd-font-mono
