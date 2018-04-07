#!/usr/bin/env bash
export POCKET="osx"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed
log "'${POCKET}' pocket uninstalling..."

remove_from_installed_pockets_list

