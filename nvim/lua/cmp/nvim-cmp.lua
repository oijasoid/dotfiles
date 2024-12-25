local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require('cmp')

vim.g.vsnip_snippet_dir = '~/.config/nvim/lua/vsnip'

local kind_icons = {
	Text = ' ',
	Method = ' ',
	Function = '󰊕 ',
	Constructor = ' ',
	Field = '󰇽 ',
	Variable = '󰀫 ',
	Class = '󰠱 ',
	Interface = ' ',
	Module = ' ',
	Property = ' ',
	Unit = ' ',
	Value = '󰎠 ',
	Enum = ' ',
	Keyword = '󰌋 ',
	Snippet = ' ',
	Color = '󰏘 ',
	File = '󰈔 ',
	Reference = ' ',
	Folder = '󰉋 ',
	EnumMember = ' ',
	Constant = '󰏿 ',
	Struct = ' ',
	Event = ' ',
	Operator = ' ',
	TypeParameter = '󰅲 ',
}

local map = {
	['<CR>'] = cmp.mapping({
		i = function(fallback)
			if cmp.visible() and cmp.get_active_entry() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
			else
				fallback()
			end
		end,
		s = cmp.mapping.confirm({ select = true }),
		c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
	}),

	['<C-n>'] = cmp.mapping(
	function(fallback)
		if cmp.visible() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		else
			fallback()
		end
	end,
	{ 'i', 's', 'c' }
	),

	['<C-p>'] = cmp.mapping(
	function (fallback)
		if cmp.visible() then
			cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		else
			fallback()
		end
	end,
	{ 'i', 's', 'c' }
	),

	['<Tab>'] = cmp.mapping(
	function (fallback)
		if cmp.visible() then
		elseif vim.fn['vsnip#available'](1) == 1 then
			feedkey('<Plug>(vsnip-expand-or-jump)', '')
		else
			fallback()
		end
	end,
	{'i', 's'}
	),

	['<S-Tab>'] = cmp.mapping(
	function (fallback)
		if cmp.visible() then
		elseif vim.fn['vsnip#available'](-1) == 1 then
			feedkey('<Plug>(vsnip-jump-prev)', '')
		else
			fallback()
		end
	end,
	{'i', 's'}
	),
}

cmp.setup {
	enabled = true,

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},

	performance = {
		trigger_debounce_time = 500,
		throttle = 550,
		fetching_timeout = 80,
		max_view_entries = 7;
	},

	view = {
		entries = 'custom',
		selection_order = 'near_cursor'
	},

	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},

	mapping = map,

	formatting = {
		fields = {'abbr', 'kind'},
		format = function(entry, vim_item)
			vim_item.kind = string.format(' %s %s', kind_icons[vim_item.kind], vim_item.kind )
			return vim_item
		end
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' , max_item_count = 200 },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'cmdline' },
	}),

	experimental = {
		ghost_text = true
	}
}

cmp.setup.cmdline({ '/', '?' }, {
	mapping = map,
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = map,
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

cmp.setup.filetype("txt", {
	enabled = false,
})
