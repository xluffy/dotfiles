"vim config by @xluffy
"
" vim-plug plugin-manager
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdTree'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  Plug 'junegunn/fzf.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mbbill/undotree'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'terryma/vim-expand-region'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-ruby/vim-ruby'
  Plug 'hashivim/vim-terraform'
  " Plug 'prabirshrestha/vim-lsp'
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'lighttiger2505/deoplete-vim-lsp'
  " Plug 'mattn/vim-lsp-settings'
call plug#end()
