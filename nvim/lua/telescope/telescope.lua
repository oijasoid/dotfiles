require('telescope').setup{
	defaults = {
		-- ...
	},
	pickers = {
		find_files = {
			hidden = true
		},
		live_grep = {
		},
		buffers = {
			theme = "dropdown",
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}

require('telescope').load_extension('fzf')
