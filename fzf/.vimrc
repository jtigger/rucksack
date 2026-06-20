"===- fzf -- fuzzy finder -===
"  https://github.com/junegunn/fzf/blob/master/README-VIM.md

let g:fzf_layout = { 'window': { 'width': 0.90, 'height': 0.9}}
let g:fzf_history_dir = '~/.fzf/fzf-history'

"==- fzf.vim
"  https://github.com/junegunn/fzf.vim
"
let g:fzf_preview_window = ['right,55%', 'ctrl-/']

nmap <c-p> :Files<CR>

" Mapping selecting mappings (in various modes)
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
