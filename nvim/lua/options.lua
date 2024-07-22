vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

if vim.fn.has("win32") then
	vim.opt.shell = 'powershell'
end

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.showmode = false

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.numberwidth = 1
vim.opt.foldcolumn = '1'

vim.opt.showtabline = 1
vim.opt.laststatus = 3

vim.opt.autoread = true

vim.opt.updatetime = 250

vim.opt.list = true
vim.opt.listchars = "trail:×,tab:· "
vim.opt.fillchars = "eob: "

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, { command = 'checktime' })
vim.api.nvim_create_autocmd({ 'TermOpen' }, { command = 'setlocal nonumber norelativenumber' })
