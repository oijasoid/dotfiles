require('telescope').setup{
  defaults = {
    -- ...
  },
  pickers = {
    find_files = {
      theme = "ivy",
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
