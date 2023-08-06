local utils = require 'utils'
local nls = require 'null-ls'
local servers = require('mason-lspconfig').get_installed_servers()

local sources = {}

-- Formatting
-- Lua
if vim.fn.executable 'stylua' == 1 then
  table.insert(sources, nls.builtins.formatting.stylua)
end

-- Prettier
if vim.fn.executable 'prettierd' == 1 then
  table.insert(sources, nls.builtins.formatting.prettierd)
elseif vim.fn.executable 'prettier' == 1 then
  table.insert(sources, nls.builtins.formatting.prettier)
end

-- tailwindcss
if vim.fn.executable 'rustywind' == 1 then
  table.insert(sources, nls.builtins.formatting.rustywind)
end

-- Rust
if utils.in_table(servers, 'rust_analyzer') then
  table.insert(sources, nls.builtins.formatting.rustfmt)
end

-- Diagnostics

if utils.isModuleAvailable 'cspell' then
  local cspell = require 'cspell'
  table.insert(sources, cspell.diagnostics)
  table.insert(sources, cspell.code_actions)
elseif vim.fn.executable 'cspell' == 1 then
  table.insert(sources, nls.builtins.diagnostics.cspell)
  table.insert(sources, nls.builtins.code_actions.cspell)
end

if vim.fn.executable 'eslint_d' == 1 then
  table.insert(sources, nls.builtins.diagnostics.eslint_d)
elseif utils.in_table(servers, 'eslint') or vim.fn.executable 'eslint' == 1 then
  table.insert(sources, nls.builtins.diagnostics.eslint)
end

if vim.fn.executable 'dotenv-linter' == 1 then
  table.insert(sources, nls.builtins.diagnostics.dotenv_linter)
end

nls.setup {
  sources = sources,
  debounce = 250,
  should_attach = function(bufnr)
    ---@diagnostic disable-next-line: redundant-parameter
    local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    if filetype == '' or filetype == 'NvimTree' then
      return false
    end

    return true
  end,
}
