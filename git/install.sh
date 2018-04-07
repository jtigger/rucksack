#!/usr/bin/env bash
export POCKET="git"

cd ~
source rucksack/_core.sh

abort_if_pocket_installed
log "'${POCKET}' pocket installing..."
add_to_installed_pockets_list

mv_to_bak .gitconfig
ln_to rucksack/git/.gitconfig .

mv_to_bak .gitconfig-grep
ln_to rucksack/git/.gitconfig-grep .

