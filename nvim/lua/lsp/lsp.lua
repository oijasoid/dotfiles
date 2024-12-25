require('mason').setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'clangd', 'glsl_analyzer' },
})

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
end

--Show symbols for diagnostics instead of letters
-- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

--Highlight line numbers instead of showing diagnostic symbols
for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
	vim.fn.sign_define("DiagnosticSign" .. diag, {
		text = "",
		texthl = "DiagnosticSign" .. diag,
		linehl = "",
		--Use same diagnostic colors as the floating diagnostic window
		--Other options are DiagnosticSign and DiagnosticVirtualText
		numhl = "DiagnosticFloating" .. diag,
	})
end

vim.diagnostic.config({
	-- signs = { text = { [vim.diagnostic.severity.ERROR] = '',
	-- 	[vim.diagnostic.severity.WARN] = '',
	-- 	[vim.diagnostic.severity.INFO] = '',
	-- 	[vim.diagnostic.severity.HINT] = '',
	-- } },
	signs = true,
	underline = true,
	virtual_text = false,
	update_in_insert = false,
	severity_sort = true,
})

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
	on_attach = on_attach,
})
lspconfig.glsl_analyzer.setup({
	on_attach = on_attach,
})
lspconfig.lua_ls.setup({
	on_attach = on_attach,
})
lspconfig.bashls.setup({
	on_attach = on_attach,
})
lspconfig.texlab.setup({
	on_attach = on_attach,
})
