-- github repository mason: https://github.com/williamboman/mason.nvim
--         nvim-lspconfig:  https://github.com/neovim/nvim-lspconfig
-- https://wiki.archlinux.org/title/Language_Server_Protocol
local vim = vim
local lspconfig = require("lspconfig")

-- github repository: https://github.com/latex-lsp/texlab
lspconfig.texlab.setup({})

-- lua
-- lspconfig.lua_ls.setup({
-- 	on_init = function(client)
-- 		local path = client.workspace_folders[1].name
-- 		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
-- 			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
-- 				Lua = {
-- 					runtime = {
-- 						-- Tell the language server which version of Lua you're using
-- 						-- (most likely LuaJIT in the case of Neovim)
-- 						version = "LuaJIT",
-- 					},
-- 					-- Make the server aware of Neovim runtime files
-- 					workspace = {
-- 						-- checkThirdParty = true,
-- 						-- library = {
-- 						-- 	vim.env.VIMRUNTIME,
-- 						-- 	-- "${3rd}/luv/library",
-- 						-- 	-- "${3rd}/busted/library",
-- 						-- },
-- 						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
-- 						library = vim.api.nvim_get_runtime_file("", true)
-- 					},
-- 				},
-- 			})
--
-- 			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
-- 		end
-- 		return true
-- 	end,
-- 	settings = {
-- 		Lua = {},
-- 	},
-- })

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

lspconfig.hls.setup({ cmd = { "haskell-language-server" } })
lspconfig.jdtls.setup({})
lspconfig.bashls.setup({})
lspconfig.cssls.setup({})
lspconfig.clangd.setup({})
lspconfig.html.setup({})

local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
