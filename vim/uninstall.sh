#!/usr/bin/env bash

cd ~
source rucksack/_core.sh

log "vim:"

rm_link .vimrc
mv_from_bak .vimrc
mv_to_cruft .vim/autoload/plug.vim
mv_from_bak .vim/autoload/plug.vim

