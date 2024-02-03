return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  config = function()
    require('telescope').setup { -- Config is optional
      vim.keymap.set('n', '<leader>ff', require 'telescope.builtin'.find_files, {}),
      vim.keymap.set('n', '<leader>fg', require 'telescope.builtin'.live_grep, {}),
      vim.keymap.set('n', '<leader>fb', require 'telescope.builtin'.buffers, {}),
      vim.keymap.set('n', '<leader>fh', require 'telescope.builtin'.help_tags, {}),
    }
  end
}
