return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
  -- open file_browser with the path of the current buffer
  config = function()
    require("telescope").setup {
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
        },
      },
      vim.api.nvim_set_keymap(
        "n",
        "<space>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { noremap = true }
      )
    }
    require("telescope").load_extension "file_browser"
  end
}
