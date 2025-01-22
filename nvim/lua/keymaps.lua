local telescope = require('telescope.builtin')

local opts = {
	noremap = true,
	silent = true
}

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>ee', vim.cmd.Ex, opts)

-- Move selected text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', "mzJ`z")

-- Half-page jumping
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")

-- Keep cursor in the middle when going to next search term
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', "\"+p")

-- Delete to void register
vim.keymap.set('n', '<leader>d', "\"_d")
vim.keymap.set('v', '<leader>d', "\"_d")

vim.keymap.set('n', '<leader>bd', vim.cmd.bd, opts)
vim.keymap.set('n', '<leader>bca', ':%bd<Enter>', opts)
vim.keymap.set('n', '<leader>bcc', ':%bd|e#|bd#<Enter>', opts)

vim.keymap.set('n', '<leader>sv', vim.cmd.vsplit, opts)
vim.keymap.set('n', '<leader>sh', vim.cmd.split, opts)
vim.keymap.set('n', '<leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<leader>l', '<C-w>l', opts)

vim.keymap.set('n', '<C-c>', ':nohls<Enter>', opts)

vim.keymap.set('n', '<leader>ff', telescope.find_files, opts)
vim.keymap.set('n', '<leader>fb', telescope.buffers, opts)
vim.keymap.set('n', '<leader>fg', telescope.live_grep, opts)
