"vim config by @xluffy
" Leader
let mapleader = " "

syntax on
filetype plugin on
filetype indent on

colorscheme monokai
set background=dark

set termguicolors
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

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
set autoread

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
nnoremap ; :

" vim-plug plugin-manager
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdTree'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'
  Plug 'jhawthorn/fzy'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  Plug 'junegunn/fzf.vim'
  Plug 'nvie/vim-flake8'
  Plug 'w0rp/ale'
  Plug 'junegunn/vim-easy-align'
  Plug 'hashivim/vim-terraform'
  Plug 'juliosueiras/vim-terraform-completion'
  Plug 'pearofducks/ansible-vim'
  Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  " Align terraform code
  Plug 'godlygeek/tabular'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'brooth/far.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'dhruvasagar/vim-zoom'
  Plug 'junegunn/limelight.vim'
  Plug 'tpope/vim-commentary'
  Plug 'mbbill/undotree'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'ConradIrwin/vim-bracketed-paste'
call plug#end()

nmap <leader>n :NERDTreeToggle<CR>

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '⚠ %dW ⤫%dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'alestatus'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'alestatus': 'LinterStatus'
      \ },
      \ }

let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
      \ 'python': ['flake8', 'pylint'],
      \ 'javascript': ['eslint'],
      \ 'ruby': ['standardrb', 'rubocop'],
      \ 'terraform': ['tflint', 'terraform'],
      \ 'yaml': ['prettier']
      \}

let g:ale_fixers = {
      \    'ruby': ['standardrb'],
      \}
let g:ale_fix_on_save = 1

let g:ale_sign_error = 'ⓧ'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0

let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'

nnoremap <leader>an :ALENextWrap<CR>
nnoremap <leader>ap :ALEPreviousWrap<CR>

" map leader
:nnoremap <leader>d dd
:nnoremap <leader>g gg
:nnoremap <Leader>w :w<CR>

" Disableing default keys to learn the hjkl

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let vim_markdown_preview_github=1

map <leader><Enter> :w<CR>:!python3 %<CR>
map <F8> :w <CR> :!g++ % -o %< && ./%< <CR>
let python_highlight_all=1

" terraform
let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_remap_spacebar=1
let g:terraform_completion_keys = 1

autocmd BufEnter *.tf* colorscheme monokai

" Tab for cycling buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

map <F2> :set paste <ENTER>
map <F3> :set nopaste <ENTER>

" Support Jenkinsfile syntax
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

" python-mode
let g:pymode_python = 'python3'

" Better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" Autopair
let g:AutoPairsMultilineClose = 0

nnoremap <silent> <leader>f :FZF<CR>
nnoremap <silent> <leader>F :FZF ~<CR>
nmap <Leader>/ :Rg<Space>
nmap <Leader>l :Limelight!!<CR>
