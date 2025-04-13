vim.opt.mouse = ''

vim.opt.encoding = 'utf-8'

vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("syntax enable")

vim.opt.completeopt = ""

vim.opt.inccommand = "split"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.smartindent = true

vim.opt.termguicolors = true

vim.opt.wrapscan = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmode = false

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.numberwidth = 1
vim.opt.foldcolumn = '1'
vim.opt.wrap = false

vim.opt.scrolloff = 10

vim.opt.showtabline = 0
vim.opt.laststatus = 3

vim.opt.autoread = true

vim.opt.list = true
vim.opt.listchars = "trail:×,tab:┃ ,lead:·"
vim.opt.fillchars = "eob: "

vim.g.matchparen_timeout=30
vim.g.matchparen_insert_timeout=10

vim.api.nvim_create_autocmd({ 'focusgained', 'bufenter' }, {
	desc= 'check for buffer changes outside of nvim.',
	command = 'checktime'
})

vim.api.nvim_create_autocmd('textyankpost', {
	desc = 'highlight when yanking text.',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function ()
		vim.highlight.on_yank()
	end,
})
