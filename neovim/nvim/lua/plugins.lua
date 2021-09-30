local cmd = vim.cmd
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
  -- packer
  use 'wbthomason/packer.nvim'

  -- Improve startup time for Neovim (cache compile for packer)
  use 'lewis6991/impatient.nvim'

  -- colorschema
  use 'sainnhe/gruvbox-material'
  
  -- indentation tracking
  use 'lukas-reineke/indent-blankline.nvim'

  -- search
  use 'romainl/vim-cool'

  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = [[require('configs.telescope_setup')]],
      config = [[require('configs.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }

  use {
    -- A replace of vim-fugivive
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('configs.gitsigns')]],
    },
    -- magic for neovim
    { 'TimUntersberger/neogit', cmd = 'Neogit', config = [[require('configs.neogit')]] },
  }

  -- pretty icon
  use 'kyazdani42/nvim-web-devicons'

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end,
  }

  use {
    'famiu/feline.nvim',
    config = function() require('feline').setup() end,
  }

  -- show color in terminal
  use {
    'norcalli/nvim-colorizer.lua',
    event = "BufRead",
    config = function() require 'colorizer'.setup() end,
  }

  -- support md, wiki
  use {
    'lukas-reineke/headlines.nvim',
    config = function()
      require('headlines').setup()
    end,
  }

  -- Buffer management
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('configs.bufferline')]],
    event = 'User ActuallyEditing',
  }
  -- Completion and linting
  use {
    'onsails/lspkind-nvim',
    'neovim/nvim-lspconfig',
    'nvim-lua/lsp-status.nvim',
    'folke/trouble.nvim',
    'ray-x/lsp_signature.nvim',
    'kosayoda/nvim-lightbulb',
  }

  -- highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate',
  }


end)
