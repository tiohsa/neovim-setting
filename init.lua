-- http://www.lazyvim.org/configuration/examples

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
    { import = 'plugins.common' },
}

local vscode_plugins = {
    -- vscode-neovimでのみ使うプラグインを列挙
    { import = 'plugins.vscode' },
}

local neovim_plugins = {
    -- Neovimでのみ使うプラグインを列挙
    { import = 'plugins.nvim' },
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

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins)
)
require('core')
require('keymap')
