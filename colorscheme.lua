require('gruvbox').setup(
{
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true,   -- invert background for search, diffs, statuslines and errors
	contrast = "soft", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})

vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox')

vim.cmd('highlight clear SignColumn')
vim.cmd('highlight clear FoldColumn')
vim.cmd('highlight clear DiagnosticSignWarn')
vim.cmd('highlight clear DiagnosticSignHint')
vim.cmd('highlight clear DiagnosticSignError')
