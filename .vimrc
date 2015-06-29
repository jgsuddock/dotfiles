
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin Installer
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree' " File Explorer
Plugin 'tpope/vim-vinegar' " File Explorer
Plugin 'rking/ag.vim' " File Search
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-unimpaired'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'bling/vim-airline' " Better Looking Command Line and Tab Line

call vundle#end()

set runtimepath+=/home/jake/lilypond/usr/share/lilypond/current/vim

filetype plugin indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""

"Turn On Wild Menu
set wildmode=list:longest,full
set wildmenu

"Always show current position
set ruler

"Show line numbers
set number

"Show matching brackets when text indicator is over them
set showmatch

"How many tenths of a second to blink when matching brackets
set mat=2

" visual reselect of just pasted
nnoremap gp `[v`]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" togglables without FN keys
set pastetoggle=<leader>2
nnoremap <leader>5 :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set smarttab

"1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

"Auto Indent
set ai

"Smart Indent
set si

"Highlight search matches
set hlsearch

"Ctrl-N turns off highlighting after search
nmap <silent> <C-N> :silent noh<CR>

"Set Ctrl-Insert to open a new tab
nnoremap <C-Insert> :tabnew 

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set guifont=Ubuntu\ Mono\ derivative\ Powerline

set background=dark

" Airline
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

" macos vs linux clipboard
if has("mac")
  set clipboard+=unnamed
else
  set clipboard=unnamedplus
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype javascript nmap ; A;<Esc>
