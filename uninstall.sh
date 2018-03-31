#!/usr/bin/env bash

# Exit on first error.  Beware: http://mywiki.wooledge.org/BashFAQ/105
set -e

cd ~
source rucksack/_core.sh

echo -e "\nbash:"
mv_to_cruft .bashrc
mv_from_bak .bashrc

mv_to_cruft .bash_profile
mv_from_bak .bash_profile

echo -e "\nvim:"
rm_link .vimrc
mv_from_bak .vimrc
mv_to_cruft .vim/autoload/plug.vim
mv_from_bak .vim/autoload/plug.vim

echo -e "\ngit:"
rm_link .gitconfig-grep
mv_from_bak .gitconfig-grep

rm_link .gitconfig
mv_from_bak .gitconfig

