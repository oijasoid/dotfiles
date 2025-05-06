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
