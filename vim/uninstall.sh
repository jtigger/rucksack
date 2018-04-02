#!/usr/bin/env bash
POCKET_NAME="vim"

cd ~
source rucksack/_core.sh

abort_if_pocket_not_installed ${POCKET_NAME}
log "'${POCKET_NAME}' pocket uninstalling..."

rm_link .vimrc
mv_from_bak .vimrc
mv_to_cruft .vim/autoload/plug.vim
mv_from_bak .vim/autoload/plug.vim

remove_from_installed_pockets_list ${POCKET_NAME}

