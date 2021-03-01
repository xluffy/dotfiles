let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
      \ 'python': ['flake8', 'pylint'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'css': ['prettier'],
      \ 'ruby': ['rubocop'],
      \ 'terraform': ['tflint', 'terraform'],
      \ 'yaml': ['prettier'],
      \ 'haml': ['hamllint'],
      \ 'sass': ['sasslint'],
      \ 'lua': ['luacheck']
      \}

let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'javascript': ['eslint', 'prettier'],
      \ 'css': ['prettier'],
      \ 'haml': ['hamllint'],
      \ 'sass': ['sasslint'],
      \ 'lua': ['luacheck']
      \}
let g:ale_fix_on_save = 0

let g:ale_sign_error = 'ⓧ'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0

let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'

let g:ale_ruby_ruby_executable = 'ruby'
let g:ale_ruby_rubocop_executable = 'bundle'
