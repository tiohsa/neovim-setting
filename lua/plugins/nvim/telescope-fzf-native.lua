return {
  'nvim-telescope/telescope-fzf-native.nvim',
  enabled = false,
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('fzf').setup { -- Config is optional
    }
    require("telescope").load_extension("fzf-native")
  end
}
