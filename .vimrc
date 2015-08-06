
" vim: foldmethod=marker foldmarker={{{,}}}


" Configuration file for Vi Improved, save as ~/.vimrc to use.
" Updated on 2015-08-04 by Jake Suddock <jacob.suddock@gmail.com>.


" zM - Fold All; zR - Unfold All; za - Toggle Current Fold

" Setup {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Vundle
" 		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 		vim +PluginInstall +qall

" Install Ag
"		apt-get install silversearcher-ag

" Install Lilypond
" 		http://lilypond.org/download.html

" Restart Vim and Run
" 		:PluginInstall!

" Install YouCompleteMe (See installation instructions on https://github.com/Valloric/YouCompleteMe)
"		cd ~/.vim/bundle/YouCompleteMe
"		./install.sh --clang-completer
"

" }}} 
" Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Required Plugin
Plugin 'gmarik/Vundle.vim'

" Vim Formatting Plugins
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe' " Fuzzy Auto Completion
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'bling/vim-airline' " Better Looking Command Line and Tab Line

" File Management Plugins
Plugin 'scrooloose/nerdtree' " File Explorer
Plugin 'ivalkeen/nerdtree-execute' " Execute System Files Using Nerdtree
Plugin 'rking/ag.vim' " File Search
Plugin 'kien/ctrlp.vim' " Fuzzy Directory Search (Ctrl + p)

" Generic Plugins
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-shell'

" Color Schemes
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'

" Language Plugins
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'DrawIt' " Ascii drawing plugin
Plugin 'chrisbra/csv.vim' " Reading CSV Files
Plugin 'tpope/vim-rails'
Plugin 'wlangstroth/vim-racket'
Plugin 'xolox/vim-notes'

" No Vundle Plugin Installation After This Line
call vundle#end()

set runtimepath+=/home/jake/lilypond/usr/share/lilypond/current/vim

filetype plugin indent on
syntax on

" }}} 
" VIM User Interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable " Enable syntax highlighting

set spell spelllang=en_us

set wildmode=list:longest,full
set wildmenu
set ruler " Always show current position
set number " Show line numbers
set showmatch " Show matching brackets when text indicator is over them

set ic " Ignore Case in Search
set hlsearch " Highlight search matches

set showcmd " Show the input of an *incomplete* command
set digraph " Input Special Character
set mat=2 " How many tenths of a second to blink when matching brackets

" visual reselect of just pasted
nnoremap gp `[v`] 

" better scrolling
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" Open new split panes to right and bottom
set splitbelow
set splitright

set shiftwidth=4 " 1 tab == 4 spaces
set tabstop=4
set smarttab
set autoindent
set smartindent

if has('mouse')
  set mouse=a
endif

"augroup myvimrc
    "au!
    "au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END

" }}}
 " Remapping {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open HTML In Browser
nnoremap <F5> :silent update<Bar>silent !google-chrome-stable %:p &<CR>

" Ctrl-N turns off highlighting after search
nmap <silent> <C-N> :silent noh<CR>

" Center Screen on Search Results
noremap n nzz
noremap N Nzz
noremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" // will search for currently highlighted text
vnoremap // y/<C-R>"<CR>

" Don't use Ex mode, use Q for formatting
map Q gq

" Set Ctrl-Insert to open a new tab
nnoremap <C-Insert> :tabnew 

" Make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" Togglables without FN keys
set pastetoggle=<leader>2

" Toggle NERDTree
nnoremap <leader>5 :NERDTreeToggle<CR>
nnoremap - :NERDTreeToggle<CR>

" Enter makes blank lines
nmap <CR> i<CR><Esc> 
" O<Esc>j

" Deletes Current File
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!

" Moving Between Split Screens
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" }}}
" Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Font
set guifont=Ubuntu\ Mono\ derivative\ Powerline

colorscheme candyman
set background=dark

" Mac OS vs Linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" }}}
" Folding {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=syntax
set foldlevelstart=1
if has("autocmd")
	au BufRead * normal zR
endif

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" }}}
" Plugin Stuff {{{ 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline {{{
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

set laststatus=2

" }}}
" }}}
" Filetype Specific Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype javascript nmap ; A;<Esc>

" }}}
