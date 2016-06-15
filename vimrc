"vim config by @xluffy
" Leader
let mapleader = " "

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
set laststatus=2
set t_Co=256
set showcmd
set autowrite

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

" Make it obvious where 80 characters is
set textwidth=95
set colorcolumn=+1

" Numbers
set number
set numberwidth=1

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
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'rking/ag.vim'
  Plugin 'itchyny/lightline.vim'
  " Plugin 'vim-airline/vim-airline'
  " Plugin 'vim-airline/vim-airline-themes'
  Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()

map <C-n> :NERDTreeToggle<CR>

" let g:airline_theme='molokai'

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" map leader
:nnoremap <leader>d dd
:nnoremap <leader>g gg
:nnoremap <leader>o :CtrlP<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1