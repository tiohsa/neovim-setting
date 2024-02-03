return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-telescope/telescope-file-browser.nvim",
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
  config = function()
    require('telescope').setup { -- Config is optional
      vim.keymap.set('n', '<leader>ff', require 'telescope.builtin'.find_files, {}),
      vim.keymap.set('n', '<leader>fg', require 'telescope.builtin'.live_grep, {}),
      vim.keymap.set('n', '<leader>fb', require 'telescope.builtin'.buffers, {}),
      vim.keymap.set('n', '<leader>fh', require 'telescope.builtin'.help_tags, {}),
    }
    require('nvim-treesitter').setup { -- Config is optional
      -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "scala", "python", "c_sharp", "bash", "markdown" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
    }
    -- open file_browser with the path of the current buffer
    -- require('nvim-treesitter').setup { -- Config is optional
    --   vim.api.nvim_set_keymap(
    --     "n",
    --     "<space>fb",
    --     ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    --     { noremap = true }
    --   )
    -- }
    -- require("telescope").load_extension "file_browser"
  end
}
