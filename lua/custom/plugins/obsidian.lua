return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  event = { 'BufReadPre ' .. vim.fn.expand '~' .. '/OneDrive/Documents/Obsidian Vault/**.md' },
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    dir = '~/OneDrive/Documents/Obsidian Vault', -- no need to call 'vim.fn.expand' here

    -- see below for full list of options 👇
  },
}
