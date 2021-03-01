"vim config by @xluffy
"
" Leader
let mapleader = " "

syntax on
filetype plugin on
filetype indent on
set background=dark

colorscheme dracula
set termguicolors

" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" General Settings "
set nocompatible
set backspace=indent,eol,start
set ruler
set nobackup
set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set scrolloff=10
set backspace=2
set laststatus=2
set t_Co=256
set showcmd
set autowrite
set autoread
set showtabline=2

" Fold
set foldmethod=syntax
set foldlevel=4

" tabs and indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=1
set number relativenumber

" system clipboard
set clipboard=unnamed

set undodir=~/.vim/undodir
set undofile

" Buffer
set hidden

" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Use :C to clear hlsearch
command! C nohlsearch

" Force write readonly files using sudo
command! WS w !sudo tee %
