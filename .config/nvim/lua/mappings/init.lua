local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }


-- setting space as map leader
keymap('n', '<Space>', '<Nop>', opts)
keymap('v', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Normal mode :

keymap('n', '<S-l>', ':vertical resize +2<CR>==', opts)
keymap('n', '<S-h>', ':vertical resize -2<CR>==', opts)
keymap('n', '<S-k>', ':resize +2<CR>==', opts)
keymap('n', '<S-j>', ':resize -2<CR>==', opts)
keymap('n', '<A-k>', ':move .-2<CR>==', opts)
keymap('n', '<A-j>', ':move .+1<CR>==', opts)
keymap('n', '<C-s>', ':w<CR>', {})
keymap('n', '<A-Up>', '<C-w><C-k>', {})
keymap('n', '<A-Down>', '<C-w><C-j>', {})
keymap('n', '<A-Left>', '<C-w><C-h>', {})
keymap('n', '<A-Right>', '<C-w><C-l>', {})
keymap('n', '<', '<<', opts)
keymap('n', '>', '>>', opts)


-- Visual mode :
keymap('v', 'p', '"_dP', opts)                          -- pasting over selected word without changing word in buffer
keymap('v', '<A-j>', ":move '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', ":move '<-2<CR>gv=gv", opts)
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Insert mode :
keymap('i', '<C-s>', '<Esc>:w<CR>a', {})
keymap('i', '<A-j>', '<ESC>:move .+1<CR>==gi', opts)
keymap('i', '<A-k>', '<ESC>:move .-2<CR>==gi', opts)
keymap('i', 'kk', '<ESC>', opts)
keymap('i', 'KK', '<ESC>', opts)

-- Terminal mode :
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)
keymap('t', '<C-ESC>', '<C-\\><C-N>', term_opts)
