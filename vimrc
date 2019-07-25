"vim config by @xluffy
" Leader
let mapleader = " "

syntax on
filetype plugin on
filetype indent on

colorscheme monokai
set background=dark

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
set textwidth=120
set colorcolumn=+1

" Numbers
set number
set numberwidth=1

" system clipboard
set clipboard=unnamed

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
  Plug 'scrooloose/nerdcommenter'
  Plug 'mileszs/ack.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'majutsushi/tagbar'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'bling/vim-bufferline'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-ruby/vim-ruby'
  Plug 'terryma/vim-expand-region'
  Plug 'srstevenson/vim-picker'
  Plug 'jhawthorn/fzy'
  Plug 'tpope/vim-surround'
  Plug 'nvie/vim-flake8'
  Plug 'w0rp/ale'
  Plug 'majutsushi/tagbar'
  Plug 'junegunn/vim-easy-align'
  Plug 'chr4/nginx.vim'
  Plug 'tpope/vim-rails'
  Plug 'hashivim/vim-terraform'
  Plug 'juliosueiras/vim-terraform-completion'
  Plug 'benmills/vimux'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'Shougo/deoplete.nvim'
  Plug 'mhinz/vim-startify'
  Plug 'craigemery/vim-autotag'
  Plug 'racer-rust/vim-racer'
  Plug 'rust-lang/rust.vim'
  Plug 'pearofducks/ansible-vim'
  Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  " Align terraform code
  Plug 'godlygeek/tabular'
call plug#end()

nmap  <leader>n :NERDTreeToggle<CR>

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:airline#extensions#ale#enabled = 1

" map jj to ESC
imap jj <Esc>

" map leader
:nnoremap <leader>d dd
:nnoremap <leader>g gg
:nnoremap <leader>o :CtrlP<CR>
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

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'
let vim_markdown_preview_github=1

map <leader><Enter> :w<CR>:!python3 %<CR>
map <F8> :w <CR> :!g++ % -o %< && ./%< <CR>
let python_highlight_all=1
let g:airline#extensions#ale#enabled = 1

au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

let g:ale_fixers = {
      \ 'python': ['flake8'],
      \ 'javascript': ['eslint'],
      \ 'ruby': ['rubocop'],
      \ 'terraform': ['tflint', 'terraform'],
      \ 'yaml': ['prettier']
      \}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_set_highlights = 0

let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'

nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
autocmd BufEnter *.tf* colorscheme monokai

" Tab for cycling buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Run the current file with rspec
map <Leader>vr :call VimuxRunCommand("clear; pwd")<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

map <F2> :set paste <ENTER>
map <F3> :set nopaste <ENTER>

" Support Jenkinsfile syntax
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

" python-mode
let g:pymode_python = 'python3'
