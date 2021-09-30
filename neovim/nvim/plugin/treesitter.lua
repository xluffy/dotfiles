local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup {
  ensure_installed = {
    'bash', 'comment', 'css', 'go',
    'html', 'javascript', 'json', 'lua',
    'python', 'regex', 'rust', 'toml', 'typescript', 'yaml'
  },
  highlight = {enable = true, use_languagetree = true},
  indent = {enable = false},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    }
  },
  refactor = {
    smart_rename = {enable = true, keymaps = {smart_rename = "grr"}},
    highlight_definitions = {enable = true}
  }
}
