#!/usr/bin/env bash
export POCKET="bash"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed
log "'${POCKET}' pocket uninstalling..."


mv_to_cruft .bashrc
mv_from_bak .bashrc

mv_to_cruft .bash_profile
mv_from_bak .bash_profile

brew_uninstall kr
brew_uninstall tree

remove_from_installed_pockets_list

