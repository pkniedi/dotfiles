local vars = require("variables")
local vim = vim

vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.wildmenu = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim

vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.o.showmode = false

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
vim.opt.expandtab = true -- enable tab characters
vim.opt.lazyredraw = true --  Do not redraw screen in the middle of a macro. Makes them complete faster.

vim.g.vimtex_view_method = "skim"
local signs = {
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- local set_hl = vim.api.nvim_set_hl -- Like vimscript 'highlight / hi'.
-- local ns_id = 0 -- Global highlight. (Namespace)

-- Diagnostic

-- set_hl(ns_id, "DiagnosticWarn",                     { fg = "#somecolor", bg = "#someothercolor", italic = false })
-- set_hl(ns_id, "DiagnosticVirtualTextWarn",          { fg = "#somecolor", bg = "#someothercolor", italic = false })
-- set_hl(ns_id, "DiagnosticError",                    { fg = "#somecolor", bg = "#someothercolor", italic = false })
-- set_hl(ns_id, "DiagnosticVirtualTextError",         { fg = "#somecolor", bg = "#someothercolor", italic = false })
-- set_hl(ns_id, "DiagnosticInfo",                     { fg = "#somecolor", bg = "#someothercolor", italic = false })
-- set_hl(ns_id, "DiagnosticHint",                     { fg = "#somecolor", bg = "#someothercolor", italic = false })

-- set_hl(ns_id, "DiagnosticVirtualTextWarn", { italic = true })
-- set_hl(ns_id, "DiagnosticError", { italic = true })
-- set_hl(ns_id, "DiagnosticVirtualTextError", { italic = true })
-- set_hl(ns_id, "DiagnosticInfo", { italic = true })
-- set_hl(ns_id, "DiagnosticHint", { italic = true })
-- set_hl(ns_id, "DiagnosticWarn", { fg = "#e86671", italic = true })

vim.cmd.colorscheme(vars.colorscheme)
-- Diagnostic Underline
-- set_hl(ns_id, "DiagnosticUnderlineError", { undercurl = true })
-- set_hl(ns_id, "DiagnosticUnderlineWarn", { undercurl = true })
-- set_hl(ns_id, "DiagnosticUnderlineInfo", { undercurl = true })
-- set_hl(ns_id, "DiagnosticUnderlineHint", { undercurl = true })

vim.g.undodir = "~/.config/nvim/undo"
vim.g.undolevels = 1000

vim.diagnostic.config({ signcolumn = true })

-- vim.cmd("set signcolumn=yes")
-- vim.cmd("highlight LspDiagnosticsUnderlineError guifg=RED guibg=RED gui=undercurl cterm=undercurl")
-- set signcolumn=yes
--

vim.cmd("set cindent")
vim.cmd("set undofile")
vim.cmd("EnableWhitespace")

vim.g.netrw_nogx = 1 -- disable netrw gx
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

-- make zsh files recognized as sh for bash-ls & treesitter

vim.filetype.add({
	extension = {
		zsh = "sh",
		sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
	},
	filename = {
		[".zshrc"] = "sh",
		[".zshenv"] = "sh",
	},
	-- FIXME:
	pattern = {
		[".*/zsh-scripts/"] = function()
			print("succ")
			return "sh"
		end,
	},
})

vim.filetype.add({
	extension = {
		i3config = "i3config",
	},
    -- filename = {
    --     ["i3config.snippets"] = "i3config"
    -- }
})
