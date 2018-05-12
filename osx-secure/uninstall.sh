#!/usr/bin/env bash
export POCKET="osx-secure"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed
log "'${POCKET}' pocket uninstalling..."

brew_uninstall dnsmasq

remove_from_installed_pockets_list

