return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('nvim-treesitter').setup { -- Config is optional
      -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "scala", "python", "c_sharp", "bash", "markdown" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
    }
  end
}
