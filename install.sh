#!/usr/bin/env bash

# Exit on first error.  Beware: http://mywiki.wooledge.org/BashFAQ/105
set -e

cd ~
source rucksack/_core.sh

echo -e "\ngit:"
mv_to_bak .gitconfig
ln_to rucksack/git/.gitconfig .
 
mv_to_bak .gitconfig-grep
ln_to rucksack/git/.gitconfig-grep .

echo -e "\nvim:"
mv_to_bak .vimrc
ln_to rucksack/vim/.vimrc .
mkdir -p .vim/autoload
mv_to_bak .vim/autoload/plug.vim
mv_from_cruft .vim/autoload/plug.vim
if [[ ! -f .vim/autoload/plug.vim ]]; then
  cp_to rucksack/vim/autoload/plug.vim .vim/autoload/plug.vim
fi

echo -e "\nbash:"
unpack_file rucksack/bash/.bash_profile.example .bash_profile
unpack_file rucksack/bash/.bashrc.example .bashrc

echo -e "\nNext steps..."
echo -e "[ ] customize .bashrc."
