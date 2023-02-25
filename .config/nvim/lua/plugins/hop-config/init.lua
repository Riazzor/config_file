require 'hop'.setup()


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('', '<leader><leader>w', '<cmd>HopWord<cr>', opts)
