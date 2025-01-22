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

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function (event)

		local map = function (keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
		map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
		map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
		map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
		map('K', vim.lsp.buf.hover, 'Hover Documentation')
		map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		map('<leader>ws', vim.lsp.buf.workspace_symbol, '[W]orkspace [S]ymbols')
		map('<leader>ds', vim.lsp.buf.document_symbol, '[D]ocument [S]ymbols')
		map('<C-h>', vim.lsp.buf.signature_help, 'Signature [H]elp')
		map('[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
		map(']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
		map('<leader>vd', vim.diagnostic.open_float, '[V]iew [D]iagnostic')
	end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = {
	clangd = {},
	glsl_analyzer = {},
	bashls = {},
	texlab = {},
	pylsp = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = 'LuaJIT' },
				workspace = {
					checkThirdParty = false,
					-- library = {
					-- 	"${3rd}/luv/library",
					-- 	unpack(vim.api.nvim_get_runtime_file("", true))
					-- }
					-- if too slow
					library = { vim.env.VIMRUNTIME }
				}
			}
		},
	}
}

require('mason').setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

local ensure_installed = vim.tbl_keys(servers or {})

require('mason-lspconfig').setup({
	ensure_installed = ensure_installed,
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}

			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			require('lspconfig')[server_name].setup(server)
		end,
	}
})
