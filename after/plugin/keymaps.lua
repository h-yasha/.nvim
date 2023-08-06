vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected line(s) down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected line(s) up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page up and center' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Move to next match and center' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Move to previous match and center' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Copy to system clipboard' })

vim.keymap.set('i', '<C-c>', '<Esc>')

-- Telescope
local telescope_builtin = require 'telescope.builtin'

-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>pf', telescope_builtin.git_files, { desc = 'Telescope: Git [F]iles' })
vim.keymap.set('n', '<C-p>', telescope_builtin.find_files, { desc = 'Telescope: Find Files' })

vim.keymap.set('n', '<leader>ps', function()
  telescope_builtin.grep_string { search = vim.fn.input 'Grep > ' }
end, { desc = 'Telescope: Grep [S]tring' })

vim.keymap.set('n', '<leader>vh', telescope_builtin.help_tags, { desc = 'Telescope: Help tags' })
