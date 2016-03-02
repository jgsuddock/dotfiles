" vim: foldmethod=marker foldmarker={{{,}}}


" Configuration file for Vi Improved, save as ~/.vimrc to use.
" Updated on 2016-03-01 by Jake Suddock <jacob.suddock@gmail.com>.


" zM - Fold All; zR - Unfold All; za - Toggle Current Fold

" Setup {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install Vim-Plug on Unix (See https://github.com/junegunn/vim-plug)
" 		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"             https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Install Ag
"		apt-get install silversearcher-ag

" Install Lilypond
" 		http://lilypond.org/download.html

" Restart Vim and Run
" 		:PluginInstall!

" Install YouCompleteMe on Unix (See https://github.com/Valloric/YouCompleteMe)
"       sudo apt-get install build-essential cmake python-dev
"		cd ~/.vim/bundle/YouCompleteMe
"		./install.py --clang-completer
"

" }}} 
" Plugins {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Vim Formatting Plugins
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
"Plug 'Valloric/YouCompleteMe' 
Plug 'nelstrom/vim-markdown-folding'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/syntastic'

" File Management Plugins
Plug 'scrooloose/nerdtree'            " File Explorer
Plug 'ivalkeen/nerdtree-execute'      " Execute System Files Using Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'                   " File Search
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy Directory Search (Ctrl + p)
Plug 'vim-scripts/a.vim'              " Opens the header file of the current
                                      " file (or vise-versa)

" Color Schemes
Plug 'chriskempson/base16-vim'
Plug 'crusoexia/vim-monokai'

" Language Plugins
Plug 'tpope/vim-fugitive'             " Git wrapper
Plug 'airblade/vim-gitgutter'         " Display Changes To Left of Numbers
Plug 'tpope/vim-rails'
Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }

filetype plugin indent on
call plug#end()

set runtimepath+=/home/jake/lilypond/usr/share/lilypond/current/vim

" }}} 
" VIM User Interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
syntax on                       " Enable syntax highlighting (override system)
"syntax enable                  " Enable syntax highlighting (system settings)
"set spell spelllang=en_us      " Checks spelling

set wildmode=list:longest,full
set wildmenu
set title                       " Modifies terminal's title
set ruler                       " Always show current position
set relativenumber              " Show line numbers relative to cursor
set number                      " Show line numbers
set hidden                      " Hide buffers instead of closing them
                                " Perserves the undo and marks history
set showmatch                   " Show matching brackets when text  
                                " indicator is over them
set ignorecase                  " Ignore Case in Search
set incsearch                   " Show search matches as you type
set hlsearch                    " Highlight search matches

set showcmd                     " Show the input of an *incomplete*
                                " command
set textwidth=78
set shiftwidth=4                " Autoindent spacing distance
set shiftround                  " Use multiple shiftwidth when indenting with '<' and '>'
set tabstop=4
set autoindent
set copyindent                  " copy previous indentation on autoindenting
set smartindent                 " smarter indent behavior
set smarttab                    " make tab and backspace smarter
set backspace=indent,eol,start  " allow backspace over indent, eol, start
set nowrap
set formatoptions=tcqlron       " auto-wrap lines/comments at textwidth,
                                " allow formatting using gq commands,
                                " long lines not broken in insert mode
                                " auto-insert comment leader on Enter or O,
                                " recognize numbered lists
"set digraph                     " Input Special Character

" visual reselect of just pasted
nnoremap gp `[v`] 

" Open new split panes to right and bottom
set splitbelow
set splitright

" Mac OS vs Linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

" Mouse Functionality
if has('mouse')
  set mouse=a
endif

" }}}
" Colors and Fonts {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme monokai


" }}}
 " Remapping {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap ; :

let mapleader=","               " changes <leader> from \ to ,

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
" Filetype Specific Settings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if javascript, c, or cpp, typing ; in normal mode to add a semicolon
autocmd Filetype javascript,c,cpp nmap ; A;<Esc>

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

" delimitMate {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let delimitMate_expand_cr = 2

" }}}

" }}}
