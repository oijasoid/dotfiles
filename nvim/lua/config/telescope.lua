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

local opts = {
	noremap = true,
	silent = true
}

local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files, opts)
vim.keymap.set('n', '<leader>en', function ()
	telescope.find_files {
	cwd = vim.fn.stdpath("config")
}
end, opts)
vim.keymap.set('n', '<leader>fb', telescope.buffers, opts)
vim.keymap.set('n', '<leader>fg', telescope.live_grep, opts)
vim.keymap.set('n', '<leader>fs', telescope.grep_string, opts)
