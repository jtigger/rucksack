" Ensure vim-plug is installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"----
call plug#begin('~/.vim/rucksack-plugged')

"  plugin library: https://vimawesome.com
Plug 'tpope/vim-sensible'                " defaults that everyone can agree on.
Plug 'altercation/vim-colors-solarized'  " my favorite color scheme
Plug 'vim-airline/vim-airline'           " status line
Plug 'airblade/vim-gitgutter'            " git-diffs in the gutter
Plug 'scrooloose/nerdtree'               " NERD tree
Plug 'dense-analysis/ale'                " ALE : linting
Plug 'fatih/vim-go'                      " Go development
Plug '/usr/local/opt/fzf'                " Fuzzy matcher (installed via brew)
Plug 'cappyzawa/starlark.vim'            " syntax highlighting  (required by ytt.vim)
Plug 'cappyzawa/ytt.vim'                 " syntax highlighting
"Plug 'scrooloose/syntastic'             " syntax highlighting

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

set directory=/tmp// " put swap files in /tmp -- they are ephemeral; don't liter the workspace.

"=========================================================================
" Plugin Configuration (alphabetical)

"==- fzf 
"  https://github.com/junegunn/fzf/blob/master/README-VIM.md

"==- nerdtree
let NERDTreeShowHidden=1

"==- vim-airline
let g:airline#extensions#ale#enabled = 1

"==- vim-go
let g:go_fmt_command = "goimports"
