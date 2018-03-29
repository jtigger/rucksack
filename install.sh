#!/usr/bin/env bash

# Exit on first error.  Beware: http://mywiki.wooledge.org/BashFAQ/105
set -e

cd ~
source rucksack/_core.sh

mv_to_bak .gitconfig
ln_to rucksack/git/.gitconfig .
 
mv_to_bak .gitconfig-grep
ln_to rucksack/git/.gitconfig-grep .

mv_to_bak .vimrc
ln_to rucksack/vim/.vimrc .

mv_to_bak .bashrc
mv_from_cruft .bashrc
if [[ ! -f .bashrc ]]; then
  cp rucksack/bash/.bashrc.example .bashrc
  echo "- copied rucksack/bash/.bashrc.example to .bashrc"
fi

