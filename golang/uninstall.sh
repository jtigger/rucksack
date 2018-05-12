#!/usr/bin/env bash
export POCKET="golang"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed
log "'${POCKET}' pocket uninstalling..."

brew_uninstall golang

remove_from_installed_pockets_list

