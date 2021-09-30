local map = require('configs.utils').map

local silent = { silent = true }
-- Navigate buffers and repos
map('n', '<leader>fb', [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map('n', '<leader>fe', [[<cmd>Telescope frecency theme=get_dropdown<cr>]], silent)
map('n', '<leader>fs', [[<cmd>Telescope git_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>ff', [[<cmd>Telescope find_files <cr>]], silent)
map('n', '<leader>fg', [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)
