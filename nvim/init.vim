"vim config by @xluffy
"
" Leader

for f in split(glob('~/.config/nvim/config/*.vimrc'), '\n')
  exe 'source' f
endfor
