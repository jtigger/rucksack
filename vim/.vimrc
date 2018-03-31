call plug#begin('~/.vim/rucksack-plugged')

Plug 'tpope/vim-sensible'                " defaults that everyone can agree on.
Plug 'altercation/vim-colors-solarized'  " my favorite color scheme

call plug#end()

"----

syntax enable
set background=light
colorscheme solarized

set number
