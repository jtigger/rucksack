call plug#begin('~/.vim/rucksack-plugged')

Plug 'tpope/vim-sensible'                " defaults that everyone can agree on.
Plug 'altercation/vim-colors-solarized'  " my favorite color scheme
Plug 'airblade/vim-gitgutter'            " git-diffs in the gutter
Plug 'fatih/vim-go'                      " Go development

call plug#end()

"----

"==- baseline
set nocompatible   " compatible disables a bunch of vim features; ensure it is off.

"==- Appearance
syntax enable
set background=light
colorscheme solarized
set number

"==- Indentation
set tabstop=2      " how many spaces a tab character is converted to when inserted.
set shiftwidth=2   " how many spaces each >> indents.
set softtabstop=2  " how many spaces a <Tab> feels like when hitting <Tab> or <BS>
set expandtab      " convert tabs to spaces

set cindent        " use the most 'clever' OOTB autoindenting strategy {autoindent, smartindent, cindent, indentexpr}
