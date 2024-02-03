-- vim.g.mapleader = ","
-- vim.g.maplocalleader = ","

-- vim.keymap.set(mode, lhs, rhs, options)

-- set s key to Window moving.
--vim.keymap.set('n', 's', '<NOP>')
--
---- set s+hjkl move to other window
--vim.keymap.set('n', 'sj', '<C-w>j')
--vim.keymap.set('n', 'sk', '<C-w>k')
--vim.keymap.set('n', 'sl', '<C-w>l')
--vim.keymap.set('n', 'sh', '<C-w>h')
--
---- set s+sv separate window
--vim.keymap.set('n', 'ss', '<C-w>s')
--vim.keymap.set('n', 'sv', '<C-w>v')
--
---- set s+nptT move tab
--vim.keymap.set('n', 'sn', 'gt')
--vim.keymap.set('n', 'sp', 'gT')
--vim.keymap.set('n', 'st', ':<C-u>tabnew<CR>')
--
---- set s+qQ kill buffer or close window
--vim.keymap.set('n', 'sq', ':<C-u>q<CR>')
--vim.keymap.set('n', 'sb', ':<C-u>bd!<CR>')

-- set ESC+ESC Clear Search hilight
vim.keymap.set('n', '<ESC><ESC>', ':<C-u>set nohlsearch!<CR>')

-- set regex very magic
vim.keymap.set('n', '/', '/\\v', { noremap = true, silent = false })
vim.keymap.set('n', '?', '?\\v', { noremap = true, silent = false })

function enable_very_magic()
  return "%s/\\v"
end

vim.api.nvim_set_keymap('c', '%s/', "v:lua.enable_very_magic()", { noremap = true, expr = true })

-- vim.keymap.set('n', 'yy', '"*yy', { noremap = true, silent = false })
-- vim.keymap.set('n', 'y', '"*y', { noremap = true, silent = false })
-- vim.keymap.set('n', 'p', '"*p', { noremap = true, silent = false })
