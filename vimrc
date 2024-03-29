execute pathogen#infect()

" " to get rid of [200~ when pasting into vim in insert mode
set t_BE=

call pathogen#helptags()

syntax on
set term=screen-256color
set t_Co=256

if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark

set path+=**

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
" colorscheme distinguished
" colorscheme vividchalk
" colorscheme flattr
" colorscheme molokai
" colorscheme jellybeans " ok
" colorscheme badwolf " kinda coll
" colorscheme railscasts " great
" colorscheme miko
" colorscheme deus

 set shell=/bin/bash

 " use the old regex engine otherwise scrolling ruby files is going to super
 " slow
 set regexpengine=1


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
 set smartindent
 set autoindent
 set hlsearch
 set incsearch
 " set nowrap
 set laststatus=2 " always show status line
 set cursorline
 set cursorcolumn
 set colorcolumn=100
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
 " set fileencodings=ucs-bom,utf-8,gbk,cp936,cp950,latin1
 set fileformat=unix
 set encoding=utf-8
 " set langmenu=zh_CN.UTF-8
 " language message zh_CN.UTF-8

 " code foldings
 set foldcolumn=4 " Column to show folds
 set foldenable
 set foldlevel=2
 set foldlevelstart=2 " Sets `foldlevel` when editing a new buffer
 set foldmethod=syntax " Markers are used to specify folds.
 set foldminlines=0 " Allow folding single lines
 set foldnestmax=3 " Set max fold nesting level

 set title


 " let javascript_fold=1
 " au FileType javascript call JavaScriptFold()

 " let g:syntastic_js_checkers=['jshint']
 " let g:syntastic_css_checkers=['csslint']
 " " let g:syntastic_check_on_open=1
 " let g:syntastic_enable_signs=1
 " " let g:syntastic_auto_loc_list=1
 " " let g:syntastic_aggregate_errors=1
 "
 
" ALE
let g:ale_linters_explicit = 1
let g:ale_linters = {'python': ['pylint'], 'sh': ['shellcheck']}
let g:ale_fixers = {'python': ['yapf'], 'c': ['clang-format'], 'cpp': ['clang-format']}
let g:ale_sign_error = '>>'
let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 0
nnoremap <leader>al :ALELint<cr>
nnoremap <leader>af :ALEFix<cr>


 " to use fzf in vim
 set rtp+=/usr/local/opt/fzf
 nnoremap <leader>f :FZF ~/<cr>


 " Conque-Shell
 nnoremap <leader>ba :ConqueTermSplit bash<cr>
 nnoremap <leader>rb :ConqueTermSplit irb<cr>

 " Startify
 nnoremap <leader>ss :SSave<cr>

 " fugitive.vim
 nnoremap <leader>gs :Gstatus<cr>
 nnoremap <leader>gb :Gblame<cr>
 nnoremap <leader>gd :Gdiff<cr>

 " Tagbar
 nnoremap <leader>tb :TagbarToggle<cr>

 " ctags
 " open tags in a tab
 nnoremap <leader><C-]> <C-w><C-]><C-w>T

 " ack.vim and the silver searcher ag
 if executable('ag')
   " let g:ackprg = 'ag --vimgrep --group --ignore=*spec.rb --ignore=*spec_helper.rb'
   let g:ackprg = 'ag --vimgrep --group'
 endif
 cnoreabbrev Ack Ack!

 " nnoremap <leader>ak :Ack!<Space><c-r><c-w> /home/teng/repos/alexeyab_darknet/<cr>
 nnoremap <leader>ak :Ack!<Space><c-r><c-w> /Users/Teng/code/ <cr>


 " CtrlP
 let g:ctrlp_match_window_bottom = 0 " Show at top of window
 let g:ctrlp_working_path_mode = 2 " Smart path mode
 let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
 let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
 " let g:ctrlp_split_window = 1 " <CR> = New Tab

 " airline
 let g:airline#extensions#ale#enabled = 1
 " let g:airline#extensions#tabline#enabled = 1
 " let g:airline#extensions#tabline#fnamemod = ':t'
 " let g:airline#extensions#tabline#left_sep = ' '
 " let g:airline#extensions#tabline#left_alt_sep = '|'

 " autocmd BufWritePre *.tpl :%s/\s\+$//e
 " autocmd FileType javascript,css,html autocmd BufWritePre <buffer> :%s/\s\+$//e


 " UltiSnips
 " let g:UltiSnipsSnippetsDir="~/.vim/ultisnippets"
 " let g:UltiSnipsSnippetDirectories=["~/.vim/ultisnippets"]
 " let g:UltiSnipsEditSplit="vertical"
 " let g:UltiSnipsExpandTrigger="<tab>"
 " " let g:UltiSnipsJumpForwardTrigger="<c-b>"
 " " let g:UltiSnipsJumpBackwardTrigger="<c-z>"
 " nmap <leader>ue :UltiSnipsEdit<cr>


 autocmd Filetype ruby setlocal ts=2 sw=2 softtabstop=2 expandtab
 autocmd Filetype cpp setlocal ts=2 sw=2 softtabstop=2 expandtab
 autocmd Filetype c setlocal ts=2 sw=2 softtabstop=2 expandtab
 autocmd Filetype vue setlocal ts=2 sw=2 softtabstop=2 expandtab
 autocmd Filetype javascript setlocal ts=2 sw=2 softtabstop=2 expandtab
 " autocmd BufRead,BufNewFile *.vue setfiletype html

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
 nnoremap <leader>nt :NERDTree<cr>

 " neat split switching
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-H> <C-W>h
 map <C-L> <C-W>l

 " resize panes
 " <slient> sliences the echo of vim
 nnoremap <silent> <Right> :vertical resize -1<cr>
 nnoremap <silent> <Left> :vertical resize +1<cr>
 nnoremap <silent> <Up> :resize +1<cr>
 nnoremap <silent> <Down> :resize -1<cr>

 " xnoremap <leader>se S<e>
 " xnoremap <leader>st1 S<t1>
 " xnoremap <leader>st2 S<t2>


 set rtp+=/home/teng/.linuxbrew/opt/fzf
