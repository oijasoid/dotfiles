require("vague").setup({
	transparent = false, -- don't set background
	-- disable bold/italic globally in `style`
	bold = true,
	italic = true,
	style = {
		-- "none" is the same thing as default. But "italic" and "bold" are also valid options
		boolean = "bold",
		number = "none",
		float = "none",
		error = "bold",
		comments = "italic",
		conditionals = "none",
		functions = "italic",
		headings = "bold",
		operators = "none",
		strings = "italic",
		variables = "none",

		-- keywords
		keywords = "none",
		keyword_return = "italic",
		keywords_loop = "none",
		keywords_label = "none",
		keywords_exception = "none",

		-- builtin
		builtin_constants = "bold",
		builtin_functions = "none",
		builtin_types = "bold",
		builtin_variables = "none",
	},
	plugins = {
		cmp = {
			match = "bold",
			match_fuzzy = "bold",
		},
		lsp = {
			diagnostic_error = "bold",
			diagnostic_hint = "none",
			diagnostic_info = "italic",
			diagnostic_warn = "bold",
		},
		telescope = {
			match = "bold",
		},
	},

	colors = {
		-- bg = "#141415",
		-- fg = "#cdcdcd",
		-- floatBorder = "#878787",
		-- line = "#252530",
		-- comment = "#606079",
		-- builtin = "#b4d4cf",
		-- func = "#c48282",
		-- string = "#e8b589",
		-- number = "#e0a363",
		-- property = "#c3c3d5",
		-- constant = "#aeaed1",
		-- parameter = "#bb9dbd",
		-- visual = "#333738",
		-- error = "#d8647e",
		-- warning = "#f3be7c",
		-- hint = "#7e98e8",
		-- operator = "#90a0b5",
		-- keyword = "#6e94b2",
		-- type = "#9bb4bc",
		-- search = "#405065",
		-- plus = "#7fa563",
		-- delta = "#f3be7c",
	},
})

vim.cmd('colorscheme vague')
