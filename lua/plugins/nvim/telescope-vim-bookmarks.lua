return {
  "tom-anders/telescope-vim-bookmarks.nvim",
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'MattesGroeger/vim-bookmarks',
  },
  config = function()
    require("telescope").load_extension "vim_bookmarks"
  end
}
