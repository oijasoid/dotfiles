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

-- Add () for function completion
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

local map = {

	['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

	['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

	['<C-Space>'] = cmp.mapping.complete {},

	['<C-y>'] = cmp.mapping.confirm { select = false },

	['<C-i>'] = cmp.mapping(
		function (fallback)
			if vim.fn['vsnip#available'](1) == 1 then
				feedkey('<Plug>(vsnip-expand-or-jump)', '')
			else
				fallback()
			end
		end,
		{'i', 's'}
	),

	['<C-o>'] = cmp.mapping(
		function (fallback)
			if vim.fn['vsnip#available'](-1) == 1 then
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

	completion = { completeopt = 'menu,menuone,noinsert' },

	window = {
		completion = {
			border = "rounded",
			winhighlight = "Normal:Normal,FloatBorder:Normal"
		},
		documentation = {
			border = "rounded",
			winhighlight = "Normal:Normal,FloatBorder:Normal"
		},
	},

	performance = {
		trigger_debounce_time = 500,
		throttle = 550,
		fetching_timeout = 80,
		max_view_entries = 10;
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
			vim_item.kind = string.format(' %s', kind_icons[vim_item.kind])
			return vim_item
		end
	},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'vsnip' },
		{ name = 'path' },
	}),

	experimental = {
		ghost_text = true,
	}
}

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'cmdline' },
		{ name = 'path' },
	})
})

cmp.setup.cmdline({'/', '?'}, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'buffer' },
	})
})
