require("gruvbox").setup({
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
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {
		SignColumn = { bg = "None" },
		FoldColumn = { bg = "None" },
		TelescopeNormal = { bg = "None" },
		CursorLineSign = { link = "CursorLine" },
		CursorLineFold = { link = "CursorLine" },
		NormalFloat = { bg = "None" },
		FloatBorder = { bg = "None" },

		GruvboxRedSign = { bg = "None" },
		GruvboxYellowSign = { bg = "None" },
		GruvboxAquaSign = { bg = "None" },
		GruvboxGreenSign = { bg = "None" },
		GruvboxBlueSign = { bg = "None" },
		GruvboxOrangeSign = { bg = "None" },
		GruvboxPurpleSign = { bg = "None" },
	},
	dim_inactive = false,
	transparent_mode = false,
})

vim.cmd('colorscheme gruvbox')
