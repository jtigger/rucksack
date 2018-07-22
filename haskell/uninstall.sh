#!/usr/bin/env bash
export POCKET="haskell"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed
log "'${POCKET}' pocket uninstalling..."

brew_cask_uninstall haskell-platform

remove_from_installed_pockets_list

