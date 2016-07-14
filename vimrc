execute pathogen#infect()

call pathogen#helptags()

syntax on

set t_Co=256
set background=dark

" colorscheme gruvbox
" colorscheme distinguished
" colorscheme vividchalk
" colorscheme flattr
" colorscheme molokai
" colorscheme jellybeans " ok
colorscheme badwolf " kinda coll
" colorscheme railscasts " great
" colorscheme miko

set shell=/bin/bash


" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo


filetype indent plugin on

set nocompatible

" highlight tabs and trailing spaces
set list listchars=tab:-\ ,trail:~
set list

set backspace=indent,eol,start
set autoindent
set hlsearch
set incsearch
set nowrap
set laststatus=2 " always show status line
set cursorline
set cursorcolumn
set nu
" using relative number so d motion is easier
set relativenumber

set smartcase

set ruler
set history=1000

" set tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" file encoding and language settings
let &termencoding=&encoding
set fileencodings=ucs-bom,utf-8,gbk,cp936,cp950,latin1
set fileformat=unix
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

" code foldings
set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=2
set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level

set title

let javascript_fold=1

au FileType javascript call JavaScriptFold()

let g:syntastic_js_checkers=['jshint']
let g:syntastic_css_checkers=['csslint']
" let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_aggregate_errors=1


" CtrlP
let g:ctrlp_match_window_bottom = 0 " Show at top of window
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
" let g:ctrlp_split_window = 1 " <CR> = New Tab

" airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

autocmd BufWritePre *.tpl :%s/\s\+$//e
autocmd FileType javascript,css,html autocmd BufWritePre <buffer> :%s/\s\+$//e

" while learning 'learn vim script the hard way'
"
" map Ctrl-U in insert mode to make the word uppercase
" viw   gets us into visual mode, and select the word
" U     makes the selection in uppercase in visual mode, 
"           and exits visual mode to normal mode and 
"           sets cursor to the begining of the word
" A     gets us in insert mode
inoremap <c-u> <esc>viwUEli<space>

" open .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" quickly back to escape mode (normal mode)
inoremap jk <esc>

" map escape to no operation to force muscle memorize new mappings to normal mode
inoremap <esc> <nop>

" Yank this whole line
nnoremap Y V$y

iabbrev javscript javascript
iabbrev destory destroy
iabbrev cahce cache

nnoremap <leader>td O// TODO<esc>

" NERD Commenter
let NERDSpaceDelims=1
let NERDCompactSexyComs=1
let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }

" neat split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
