local utils = require 'configs.utils'
local map = utils.map

-- remove newbie crutches in Insert Mode
map('i', '<Down>', '<Nop>')
map('i', '<Left>', '<Nop>')
map('i', '<Right>', '<Nop>')
map('i', '<Up>', '<Nop>')

-- remove newbie crutches in Normal Mode
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')
map('n', '<Up>', '<Nop>')

-- remove newbie crutches in Visual Mode
map('v', '<Down>', '<Nop>')
map('v', '<Left>', '<Nop>')
map('v', '<Right>', '<Nop>')
map('v', '<Up>', '<Nop>')

-- tab for cycling buffers
map('n', '<Tab>', '<cmd>bnext<cr>')
map('n', '<S-Tab>', '<cmd>bprevious<cr>')
map('n', '<c-x>', '<cmd>bdelete<cr>')

-- open vertical split
map('n', '<Leader>v', '<C-w>v')

-- Move between slits
map('n', '<c-h>', '<C-w>h')
map('n', '<c-j>', '<C-w>j')
map('n', '<c-k>', '<C-w>k')
map('n', '<c-l>', '<C-w>l')
map('n', '<c-h>', '<C-\\><C-n><C-w>h')
map('n', '<c-l>', '<C-\\><C-n><C-w>l')

-- Copy to system clipboard
map('v', '<C-c>', '"+y')
-- Paste from system clipboard with Ctrl + v
map('i', '<C-v>', '<Esc>"+p')
map('n', '<Leader>p', '"0p')
map('v', '<Leader>p', '"0p')
map('n', '<Leader>h', 'viw"0p', { nowait = false })

-- Move to the end of yanked text after yank and paste
map('n', 'p', 'p`]')
map('n', 'p', 'p`]')
map('v', 'y', 'y`]')
map('v', 'p', 'p`]')

-- Move selected lines up and down
map('v', 'J', ":m '>+3<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('c', '<C-a>', '<Home>', { silent = false })
map('c', '<C-e>', '<End>', { silent = false })

-- map for nvim-tree
map('n', '<leader>n', ':NvimTreeToggle <CR>')
map('n', '<leader>r', ':NvimTreeRefresh <CR>')

