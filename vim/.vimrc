execute pathogen#infect()
" General Appearance
set number               " displays line numbers in the left gutter.
set ruler                " displays current line and column in the status bar.
syntax enable            " enables syntax highlighting
colorscheme solarized    " use Solarized (in ~/.vim/colors)
set background=light     " which of the two Solarized color schemes to use: dark or light.

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

" Search
set incsearch          " enable incremental search; shows match as you type.
set hlsearch           " highlight all matches in the buffer.

" Indentation (i.e. no tabs, 2 spaces)
set expandtab              " expand tabs to spaces
set shiftwidth=2           " how many spaces to insert (or removed) when indenting
set softtabstop=2          " how many spaces to insert when <Tab> is hit.
filetype plugin indent on  " use indentation rules by filetype (defined in $VIMRUNTIME/indent/)

" buffer
set hidden             " allow "hidden" buffers.
