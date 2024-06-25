function Terminal(floating)
	if(floating > 0) then
		local width = 100
		local height = 25

		local buf = vim.api.nvim_create_buf(false, true)

		local ui = vim.api.nvim_list_uis()[1]

		local op = {
			relative='editor',
			width=width,
			height=height,
			col=(ui.width/2)-(width/2),
			row=(ui.height/2)-(height/2),
			style='minimal',
			border='solid'
		}

		vim.api.nvim_open_win(buf, 1, op)
		vim.cmd("terminal")
		vim.cmd("startinsert")
	else
		vim.cmd("split")
		vim.cmd("winc j")
		vim.cmd("resize 10")
		vim.cmd("terminal")
		vim.cmd("startinsert")
	end
end
