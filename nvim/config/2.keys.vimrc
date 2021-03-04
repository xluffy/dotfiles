nnoremap ; :

" map leader
:nnoremap <leader>d dd
:nnoremap <leader>g gg
:nnoremap <Leader>w :w<CR>

" Remove newbie crutches in Command Mode
" cnoremap <Down> <Nop>
" cnoremap <Left> <Nop>
" cnoremap <Right> <Nop>
" cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" Tab for cycling buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

inoremap jk <ESC>
nmap <Leader>- <Plug>(choosewin)

nnoremap <silent> <leader>f :FZF .<CR>
nnoremap <silent> <leader>F :FZF ../<CR>

nmap <Leader>/ :Rg<Space>
