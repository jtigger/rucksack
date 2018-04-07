#!/usr/bin/env bash
export POCKET="java"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed
log "'${POCKET}' pocket uninstalling..."

brew_cask_uninstall font-dejavusansmono-nerd-font-mono
# brew_cask_uninstall java8

remove_from_installed_pockets_list

