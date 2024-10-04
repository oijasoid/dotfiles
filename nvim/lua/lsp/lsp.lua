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
	ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd', 'cmake', 'glsl_analyzer' },
})

local on_attach = function(cllient, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded',
				source = 'always',
				prefix = ' ',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})

	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, opts)
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


local clang_cmd = {}
if vim.fn.has("win32") then
	--on windows, install gcc using msys64.
	--packages to install are base-devel mingw-w64-ucrt-x86_64-toolchain
	--then add ucrt64/bin to path
	clang_cmd = {
		"clangd",
		"--query-driver=C:\\PROGRA~2\\msys64\\ucrt64\\bin\\C__~1.EXE"
	}
end

lspconfig.clangd.setup({
	on_attach = on_attach,
	cmd = clang_cmd,
})
lspconfig.glsl_analyzer.setup({
	on_attach = on_attach,
})
lspconfig.lua_ls.setup({
	on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
})
lspconfig.cmake.setup({
	on_attach = on_attach,
})
lspconfig.bashls.setup({
	on_attach = on_attach,
})
