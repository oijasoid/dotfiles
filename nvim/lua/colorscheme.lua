require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "frappe",
	},
	transparent_background = false, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = true, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = {}, -- Change the style of comments
		conditionals = {"italic"},
		loops = {"italic"},
		functions = {"italic"},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {"italic"},
		types = {"italic"},
		operators = {},
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
	color_overrides = {},
	custom_highlights = {},
	default_integrations = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

vim.opt.background = 'dark'
vim.cmd('colorscheme catppuccin')
