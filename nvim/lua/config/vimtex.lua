vim.g.vimtex_view_method = 'zathura'

vim.opt.conceallevel = 1
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.tex_conceal = 'abmgs'

vim.g.vimtex_compiler_latexmk = {
	aux_dir = '',
	out_dir = '',
	callback = 1,
	continuous = 1,
	executable = 'latexmk',
	hooks = {},
	options = {
		'-verbose',
		'-shell-escape',
		'-file-line-error',
		'-synctex=1',
		'-interaction=nonstopmode',
	},
}
