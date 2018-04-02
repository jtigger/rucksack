#!/usr/bin/env bash

cd ~
source rucksack/_core.sh

log "vim:"

mv_to_bak .vimrc
ln_to rucksack/vim/.vimrc .

mkdir -p .vim/autoload
mv_to_bak .vim/autoload/plug.vim
mv_from_cruft .vim/autoload/plug.vim

if [[ ! -f .vim/autoload/plug.vim ]]; then
  cp_to rucksack/vim/autoload/plug.vim .vim/autoload/plug.vim
fi

