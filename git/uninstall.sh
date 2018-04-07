#!/usr/bin/env bash
export POCKET="git"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed
log "'${POCKET}' pocket uninstalling..."

rm_link .gitconfig-grep
mv_from_bak .gitconfig-grep

rm_link .gitconfig
mv_from_bak .gitconfig

remove_from_installed_pockets_list
