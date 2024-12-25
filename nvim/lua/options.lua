vim.opt.mouse = ''

vim.opt.encoding = 'utf-8'

vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("syntax enable")

vim.opt.completeopt = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.showmode = false

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = false
vim.opt.smartcase = true

vim.opt.numberwidth = 1
vim.opt.foldcolumn = '1'
vim.opt.wrap = false

vim.opt.scrolloff = 8

vim.opt.showtabline = 1
vim.opt.laststatus = 3

vim.opt.autoread = true

vim.opt.list = true
vim.opt.listchars = "trail:×,tab:· "
vim.opt.fillchars = "eob: "

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, { command = 'checktime' })
