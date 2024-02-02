return {
  {
    'vscode-neovim/vscode-multi-cursor.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function()
      require('vscode-multi-cursor').setup { -- Config is optional
        -- Whether to set default mappings
        default_mappings = true,
        -- If set to true, only multiple cursors will be created without multiple selections
        no_selection = false,
        vim.keymap.set('n', '<C-d>', 'mciw*<Cmd>nohl<CR>', { remap = true })
      }
    end
  }
}
