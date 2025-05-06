local opts = {
	noremap = true,
	silent = true
}

local harpoonMark = require('harpoon.mark')
local harpoonUI = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', harpoonMark.add_file, opts);
vim.keymap.set('n', '<C-g>', harpoonUI.toggle_quick_menu, opts);

vim.keymap.set('n', '<C-h>', function() harpoonUI.nav_file(1) end, opts);
vim.keymap.set('n', '<C-j>', function() harpoonUI.nav_file(2) end, opts);
vim.keymap.set('n', '<C-k>', function() harpoonUI.nav_file(3) end, opts);
vim.keymap.set('n', '<C-l>', function() harpoonUI.nav_file(4) end, opts);
