function merge_tables(t1, t2)
    local merged = {}
    for _, v in ipairs(t1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(t2) do
        table.insert(merged, v)
    end
    return merged
end

local is_vscode = vim.g.vscode == 1

local common_plugins = {
    -- 両方で使うプラグインを列挙
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        -- https://github.com/ggandor/leap.nvim
        "ggandor/leap.nvim",
        enabled = true,
        keys = {
            { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },
    {
        'machakann/vim-highlightedyank',
        config = function()
            vim.g.highlightedyank_highlight_duration = 300
        end
    },
}

local vscode_plugins = {
    -- vscode-neovimでのみ使うプラグインを列挙
    {
        -- https://github.com/vscode-neovim/vscode-multi-cursor.nvim
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

local neovim_plugins = {
    -- Neovimでのみ使うプラグインを列挙
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('core')
require('keymap')
require('lazy').setup(
    merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins)
)
