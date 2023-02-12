local map = vim.api.nvim_set_keymap

-- leader
map('n','<Space>', '', {})
vim.g.mapleader = ' '

-- test
local options = { noremap = true }
map('n', '<leader>e', ':NvimTreeFocus<cr>', options)
map('n', '<leader>E', ':NvimTreeToggle<cr>', options)
