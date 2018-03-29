#!/usr/bin/env bash

# Exit on first error.  Beware: http://mywiki.wooledge.org/BashFAQ/105
set -e


cd ~
source rucksack/_core.sh

mv_to_cruft .bashrc
mv_from_bak .bashrc

rm_link .vimrc
mv_from_bak .vimrc

rm_link .gitconfig-grep
mv_from_bak .gitconfig-grep

rm_link .gitconfig
mv_from_bak .gitconfig

