"vim config by @xluffy

syntax on
filetype plugin on
filetype indent on

colorscheme monokai

" General Settings "
set nocompatible
set backspace=indent,eol,start
set ruler
set nobackup 
set encoding=utf-8
set scrolloff=10
set backspace=2
set textwidth=79
set laststatus=2
set t_Co=256

" tabs and indenting
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" searching
set hlsearch 
set incsearch
set ignorecase
set smartcase

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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdTree'
  Plugin 'rking/ag.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

map <C-n> :NERDTreeToggle<CR>

let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1