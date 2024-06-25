require('terminal.terminal')

local telescope = require('telescope.builtin')

local opts = {
	noremap = true,
	silent = true
}

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, opts)

vim.keymap.set('n', '<leader>bd', vim.cmd.bd, opts)

vim.keymap.set('n', '<leader>sv', vim.cmd.vsplit, opts)
vim.keymap.set('n', '<leader>sh', vim.cmd.split, opts)

vim.keymap.set('n', '<leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<leader>l', '<C-w>l', opts)

vim.keymap.set('t', '<C-c>', '<C-\\><C-n>', opts)
vim.keymap.set('t', '<C-j>', '<down>', opts)
vim.keymap.set('t', '<C-k>', '<up>', opts)

vim.keymap.set('n', '<leader>q', vim.cmd.quit, opts)
vim.keymap.set('n', '<leader>w', vim.cmd.write, opts)

vim.keymap.set('n', '<leader>ff', telescope.find_files, opts)
vim.keymap.set('n', '<leader>fb', telescope.buffers, opts)
vim.keymap.set('n', '<leader>fg', telescope.live_grep, opts)

vim.keymap.set('n', '<leader>t', function() Terminal(0) end, opts)

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
