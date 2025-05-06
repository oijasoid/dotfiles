return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"telescope-fzf-native.nvim"
	},
	config = function ()
		require("config.telescope")
	end
}
