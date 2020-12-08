"vim config by @xluffy
"

"
" NERDTree
"
nmap <leader>n :NERDTreeToggle<CR>
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

"
" expand region
"
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '┆'

" Better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" Autopair
let g:AutoPairsMultilineClose = 0


let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

let g:lightline                  = {}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}


" if you want to use overlay feature
let g:choosewin_overlay_enable = 1
" FZF config
let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.7,
      \ 'highlight': 'Comment',
      \ 'rounded': v:false } }
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

let g:terraform_align=1
let g:terraform_fmt_on_save=1
autocmd BufEnter *.tf* colorscheme dracula
