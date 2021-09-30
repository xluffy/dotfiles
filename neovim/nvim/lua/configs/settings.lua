local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo

local utils = require 'configs.utils'
local opt = utils.opt

local buffer = { o, bo }
local window = { o, wo }

g.mapleader = [[ ]]
g.maplocalleader = [[,]]

g.loaded_python_provider = 0
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python3'

local disabled_built_ins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
}

for _, plugin in pairs(disabled_built_ins) do
   g['loaded_' .. plugin] = 1
end

-- General settings
opt('ruler', true)
opt('ffs', 'unix')
opt('encoding', 'utf-8')
opt('fileencoding', 'utf-8')
opt('scrolloff', 10)
opt('laststatus', 2)
opt('showcmd', true)
opt('autowrite', true)
opt('autoread', true)
opt('showtabline', 2)
opt('backspace', 'indent,eol,start')
opt('wildignore', '*.o,*.obj,*.git*,*__pycache__*,*logs*,*node_modules*,**/node_modules/**,*DS_Store*')
opt('wildmode', 'longest,full')
opt('whichwrap', vim.o.whichwrap .. '<,>,h,l')
opt('inccommand', 'nosplit')
opt('lazyredraw', true)
opt('showmatch', true)

-- Text
opt('textwidth', 100, buffer)
opt('colorcolumn', '+1')

-- tabs and indenting
opt('tabstop', 2, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', 2, buffer)
opt('autoindent', true)

-- number
opt('number', true, window)
opt('relativenumber', true, window)
opt('numberwidth', 1)

-- searching
opt('hlsearch', true)
opt('incsearch', true)
opt('ignorecase', true)
opt('smartcase', true)

-- system clipboard
opt('clipboard', 'unnamedplus')

-- buffer
opt('hidden', true)

-- undo
opt('undofile', true, buffer)
opt('undodir', '/Users/xluffy/.nvim/undodir')

-- share data, remember status
opt('shada', [['20,<50,s10,h,/100]])
opt('shortmess', o.shortmess .. 'c')
opt('joinspaces', false)
opt('guicursor', [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt('updatetime', 500)
opt('conceallevel', 2, window)
opt('concealcursor', 'nc', window)
opt('previewheight', 5)
opt('synmaxcol', 500, buffer)
opt('display', 'msgsep')
opt('modeline', false, buffer)
opt('mouse', 'nivh')
opt('signcolumn', 'yes:1', window)

-- colorsceme
opt('termguicolors', true)
opt('background', 'dark')
cmd [[colorscheme gruvbox-material]]

-- Commands
cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
