require('telescope').setup{
	defaults = {
		-- ...
	},
	pickers = {
		find_files = {
			theme = "ivy",
			hidden = true
		},
		live_grep = {
			theme = "ivy",
		},
		buffers = {
			theme = "dropdown",
		}
	},
	extensions = {
		-- ...
	}
}
