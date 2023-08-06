vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. '/.vim.undodir'

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'

vim.cmd.colorscheme 'tokyonight'

-- signs
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })
