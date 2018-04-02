call plug#begin('~/.vim/rucksack-plugged')

Plug 'tpope/vim-sensible'                " defaults that everyone can agree on.
Plug 'altercation/vim-colors-solarized'  " my favorite color scheme

call plug#end()

"----

"==- Appearance
syntax enable
set background=light
colorscheme solarized
set number

"==- Indentation
set tabstop=2      " how many spaces a tab character is converted to
set shiftwidth=2   " how many spaces each >> command indents.
set softtabstop=2  " how many spaces a <Tab> feels like when hitting <Tab> or <BS>
set autoindent     " copy indent from previous line
set expandtab      " convert tabs to spaces
