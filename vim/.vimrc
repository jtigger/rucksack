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
Plug 'vim-airline/vim-airline-themes'    " + themes
Plug 'airblade/vim-gitgutter'            " git-diffs in the gutter

Plug 'mg979/vim-visual-multi'            " Multi-cursor (ctrl+n)
Plug 'tpope/vim-surround'                " Change surrounding tokens (cs, ds, ys)

Plug 'dense-analysis/ale'                " ALE : linting
Plug 'tpope/vim-commentary'              " Toggle comments
Plug 'tpope/vim-fugitive'                " Git client

Plug 'elixir-editors/vim-elixir'         " vim config for Elixir


call plug#end()

if empty($VIM_BACKGROUND)
  " light | dark
  let g:background="dark"
else
  let g:background=$VIM_BACKGROUND
endif

"=========================================================================
" Plugin Configuration (alphabetical)


"==- vim-airline
let g:airline_theme="solarized"
let g:airline_solarized_bg=g:background

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '💣:'
let g:airline#extensions#ale#warning_symbol = '⚠️:'

let g:airline#extensions#branch#enabled = 1

"==- vim-colors-solarized
let g:solarized_italic = 1

"=========================================================================
" vim Config
"    (keep after plugin config so plugins can modify features)

"==- baseline
set nocompatible   " compatible disables a bunch of vim features; ensure it is off.
set modelines=5    " restore default lines searched for '# vim ...'  (cleared by a plugin?)

"==- Appearance
syntax enable
let &background=g:background  " equiv to `set background=(setting of g:background)`
colorscheme solarized
" invisible chars
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
highlight SpecialKey ctermfg=14 ctermbg=15 guifg=LightCyan

set number          " show line numbers
set incsearch       " show searching incrementally (as you type)
set hlsearch        " highlight all search matches
                    " <esc> clears search highlights
nmap <esc> :noh<cr>
set scrolloff=5     " keep cursor away from edge while scrolling

"==- Indentation
set tabstop=2      " how many spaces a tab character is converted to when inserted.
set shiftwidth=2   " how many spaces each >> indents.
set softtabstop=2  " how many spaces a <Tab> feels like when hitting <Tab> or <BS>
set expandtab      " convert tabs to spaces

set cindent        " use the most 'clever' OOTB autoindenting strategy {autoindent, smartindent, cindent, indentexpr}

set directory=/tmp/ " put swap files in /tmp -- they are ephemeral; don't liter the workspace.
