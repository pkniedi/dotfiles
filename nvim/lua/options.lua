local vars = require("variables")
local vim = vim

vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.wildmenu = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"           -- allow the mouse to be used in Nvim

vim.opt.tabstop = 8           -- number of visual spaces per TAB
vim.opt.softtabstop = 8       -- number of spacesin tab when editing
vim.opt.shiftwidth = 8        -- insert 4 spaces on a tab
vim.opt.expandtab = true      -- tabs are spaces, mainly because of python
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true     -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right
vim.opt.termguicolors = true  -- enable 24-bit RGB color in the TUI
vim.o.showmode = false

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = true   -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered
vim.opt.expandtab = true  -- enable tab characters
vim.opt.lazyredraw = true --  Do not redraw screen in the middle of a macro. Makes them complete faster.

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

vim.cmd.colorscheme(vars.colorscheme)

vim.g.undodir = "~/.config/nvim/undo"
vim.g.undolevels = 1000
vim.diagnostic.config({ signcolumn = true })
vim.cmd("set undofile")

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


-- Highlighting groups in Lua
vim.cmd('hi NonText ctermbg=none guibg=NONE')
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
vim.cmd('hi NormalNC guibg=NONE ctermbg=NONE')
vim.cmd('hi SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE')

vim.cmd('hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE')
vim.cmd('hi FloatBorder ctermbg=NONE ctermfg=NONE guibg=NONE')
vim.cmd('hi NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE')
vim.cmd('hi TabLine ctermbg=None ctermfg=None guibg=None')

-- Make bufferline background transparent
vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = 'NONE' })        -- Background of the entire bufferline
vim.api.nvim_set_hl(0, 'BufferLineBackground', { bg = 'NONE' })  -- Background of inactive buffers
vim.api.nvim_set_hl(0, 'BufferLineTab', { bg = 'NONE' })         -- Background of active buffers
vim.api.nvim_set_hl(0, 'BufferLineTabSelected', { bg = 'NONE' }) -- Background of selected buffer
vim.api.nvim_set_hl(0, 'BufferLineTabClose', { bg = 'NONE' })    -- Background of the close button
