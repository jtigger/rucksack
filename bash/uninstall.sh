#!/usr/bin/env bash
POCKET_NAME="bash"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed ${POCKET_NAME}
log "'${POCKET_NAME}' pocket uninstalling..."

mv_to_cruft .bashrc
mv_from_bak .bashrc

mv_to_cruft .bash_profile
mv_from_bak .bash_profile

brew_uninstall tree

remove_from_installed_pockets_list ${POCKET_NAME}

