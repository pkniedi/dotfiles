
-- ██╗     ███████╗██████╗
-- ██║     ██╔════╝██╔══██╗
-- ██║     ███████╗██████╔╝
-- ██║     ╚════██║██╔═══╝
-- ███████╗███████║██║
-- ╚══════╝╚══════╝╚═╝
--   https://github.com/neovim/nvim-lspconfig
-- 󰣇 https://wiki.archlinux.org/title/Language_Server_Protocol


local vim = vim
local lspconfig = require("lspconfig")

-- github repository:    https://github.com/latex-lsp/texlab
--


lspconfig.texlab.setup({})
lspconfig.denols.setup({})

lspconfig.diagnosticls.setup({})
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

require("lspconfig").pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391" },
					maxLineLength = 100,
				},
			},
		},
	},
})

-- lspconfig.ocamllsp.setup({
-- 	cmd = { "ocamllsp" },
-- 	filetypes = { "ocaml", "reason" },
-- 	root_dir = require("lspconfig").util.root_pattern(
-- 		"*.opam",
-- 		"esy.json",
-- 		"package.json",
-- 		".git",
-- 		"dune-project",
-- 		"dune-workspace",
-- 		"hw*"
-- 	),
-- })
--
lspconfig.jdtls.setup({})
lspconfig.bashls.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.cssls.setup({
--         capabilities = capabilities,
-- })

lspconfig.clangd.setup({})

lspconfig.rust_analyzer.setup({
	-- Server-specific settings. See `:help lspconfig-setup`
	settings = {
		["rust-analyzer"] = {},
	},
})
lspconfig.html.setup({})

-- NOTE: moved to after/ftplugin
--
-- vim.diagnostic.config({
-- 	virtual_text = false, -- text on the right side
-- 	signs = true,
-- 	underline = true,
-- 	update_in_insert = true,
-- })

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local M = {}

M.icons = {
	Class = " ",
	Color = " ",
	Constant = " ",
	Constructor = " ",
	Enum = " ",
	EnumMember = " ",
	Field = "󰄶 ",
	File = " ",
	Folder = " ",
	Function = " ",
	Interface = "󰜰",
	Keyword = "󰌆 ",
	Method = "ƒ ",
	Module = "󰏗 ",
	Property = " ",
	Snippet = "󰘍 ",
	Struct = " ",
	Text = " ",
	Unit = " ",
	Value = "󰎠 ",
	Variable = " ",
}

function M.setup()
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = M.icons[kind] or kind
	end
end

return M
