-- github repository: https://github.com/hrsh7th/nvim-cmp

local vim = vim
local lspkind = require("lspkind")
local cmp = require("cmp")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({

	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},

	view = {
		entries = { name = "custom", selection_order = "near_cursor" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = {
		-- ["<Tab>"] = cmp.mapping({
		-- 	c = function()
		-- 		if cmp.visible() then
		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		-- 		else
		-- 			cmp.complete()
		-- 		end
		-- 	end,
		-- 	i = function(fallback)
		-- 		if cmp.visible() then
		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		-- 		elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
		-- 			vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- 	s = function(fallback)
		-- 		if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
		-- 			vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- }),
		["<S-Tab>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				else
					cmp.complete()
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
				elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
				else
					fallback()
				end
			end,
			s = function(fallback)
				if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
					return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
				else
					fallback()
				end
			end,
		}),
		["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i" }),
		["<C-n>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					vim.api.nvim_feedkeys(t("<Down>"), "n", true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end,
		}),
		["<C-p>"] = cmp.mapping({
			c = function()
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					vim.api.nvim_feedkeys(t("<Up>"), "n", true)
				end
			end,
			i = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end,
		}),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- ... Your other configuration ...
	},
	-- Let's configure the item's appearance
	-- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance

	formatting = {
		-- Set order from left to right
		-- kind: single letter indicating the type of completion
		-- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
		-- menu: extra text for the popup menu, displayed after "word" or "abbr"
		fields = { "abbr", "kind", "menu" },

		format = lspkind.cmp_format({

			mode = "symbol_text", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			-- can also be a function to dynamically calculate max width such as
			-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			show_labelDetails = true, -- show labelDetails in menu. Disabled by default

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = "[Lsp]",
					ultisnips = "[UltiSnips]",
					buffer = "[File]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	sources = cmp.config.sources({
		enable = true,
		{ name = "calc" },
		{ name = "nvim_lsp" }, -- For nvim-lsp
		{ name = "path" }, -- For path completion
		{ name = "ultisnips" }, -- For ultisnips
		{ name = "treesitter" },
		{ name = "buffer" }, -- For buffer word completion
	}),
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{
				name = "cmdline",
				option = {
					ignore_cmds = { "Man", "!" },
				},
			},
		}),
	}),
	cmp.setup.cmdline({ "/", "?" }, {
		-- view = {
		-- 	entries = { name = "wildmenu", separator = "|" },
		-- },
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	}),
})
