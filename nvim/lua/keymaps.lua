local user_functions = require("user-functions")
local builtin = require("telescope.builtin")
local util_funcs = require("utility-functions")

local vim = vim
local map = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

vim.g.maplocalleader = ","
vim.g.mapleader = " "
-- reload the configuration
vim.api.nvim_set_keymap("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })

map("n", "<C-w>", ":bd<CR>", opts)
map("n", "<C-S-h>", ":bp<CR>", opts)
map("n", "<C-S-l>", ":bn<CR>", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>sc", [[:set spell!<CR>]], opts)
map("n", [[<leader>noh]], [[:noh<CR>]], opts)
map("n", [[gf]], [[:e <cfile><CR>]], { desc = "Goto file" })
-- map("n", [[gf]], function()
-- 	vim.cmd()
-- 	if vim.fn.expand("%") == "defaults" then
-- 		print(vim.api.nvim_get_current_line())
-- 		vim.fn.system({
-- 			"zathura",
-- 			vim.api.nvim_get_current_line(),
-- 			"&",
-- 		})
-- 	end
-- end, { desc = "Goto file" })
map("n", "<leader>ff", builtin.find_files, opts)
map("n", "<leader>fg", builtin.live_grep, opts)
map("n", "<leader>fb", builtin.buffers, opts)
map("n", "<leader>fh", builtin.help_tags, opts)
map("n", "<leader>lt", [[:ListcharsToggle<CR>]], opts)
map("n", [[<leader>fo]], [[:Format<CR>]], opts)
map("n", [[<leader>fw]], [[:FormatWrite<CR>]], opts)
map("n", [[<leader>ul]], [[:call UltiSnips#RefreshSnippets()<CR>]], opts)
map("n", [[<leader>?]], [[:Cheatsheet<CR>]], opts)
map("n", [[<leader>ss]], [[:split<CR>]], opts)
map("n", [[<leader>cc]], [[:close<CR>]], opts)
map("n", [[<leader>fq]], [[:set formatoptions=jrql<CR>]], opts)
map("n", [[<leader>tr]], [[:TransparentToggle<CR>]], opts)
map("n", [[<leader>th]], [[:TSToggle highlight<CR>]], opts)
map("n", [[<leader>bs]], [[:BufferOrderByBufferNumber<CR>]], opts)
map("n", "<space>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)
map("n", [[<leader>td]], [[:UndotreeToggle<CR>]])
map("n", [[<leader>ha]], [[:lua require("harpoon.mark").add_file()<CR>]])
map("n", [[<leader>ht]], [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]])
map("n", [[<leader>mp]], [[:MarkdownPreview<CR>]], opts)
map("n", [[<leader>gt]], [[:r!gettex -t s -n ]], opts)
map("n", [[<leader>pv]], [[yi[:!playvid <CR>]], opts)
map("n", "<leader>oo", ":Outline<CR>", { desc = "Toggle Outline" })
map("n", "<leader>ol", ":Outline!<CR>", { desc = "Toggle Outline" })
map("n", [[<leader>wr]], [[:set wrap<CR>]], opts)
map("n", [[<leader>nw]], [[:set nowrap<CR>]], opts)
map("i", [[<C-p>]], [[<C-r>]], opts)
map("n", [[gx]], function()
	user_functions.my_open_url()
end)

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", [[<leader>tt]], [[:TodoTelescope<CR>]], opts)
map("n", "<leader><space>", "<cmd>Telescope buffers<cr>")
map("n", "<leader>?", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
map("n", [[<leader>bd]], [[:bd<CR>]], opts)
map("n", [[<leader>bn]], [[:bn<CR>]], opts)
map("n", [[<leader>bp]], [[:bp<CR>]], opts)
map("n", [[<leader>ou]], [[:!openurls %<CR>]], opts)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		-- map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		map("n", "<space>D", vim.lsp.buf.type_definition, opts)
		map("n", "<space>rn", vim.lsp.buf.rename, opts)
		map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
map("n", "<bs>", ":edit #<cr>", { silent = true })
map("n", [[<leader>gn]], function()
	print(vim.api.nvim_buf_get_name(0))
end, opts)

map("n", [[<leader>gw]], [[:r! getwiki ]], opts)

map("n", [[<CR>]], function()
	user_functions.my_open_url()
end, opts)

map("n", [[<localleader>tt]], function()
	util_funcs.create_default_makefile()
end, { desc = "" })
--
-- make keymaps
map("n", [[<leader>mm]], [[:!make<CR>]], { desc = "run make" })
map("n", [[<leader>ma]], [[:!make ]], { desc = ":!" })
map("n", [[<leader>mf]], [[:!make test-full<CR>]], { desc = ":!make test-full<CR>" })
map("n", [[<leader>mt]], [[:!make test<CR>]], { desc = ":!make test<CR>" })

map("n", [[<leader>ss]], [[:SubSQL<CR>]], { desc = "Substitute SQL statements" })

-- visual mode
map("v", "p", '"_dP')
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<leader>sv", function()
	if vim.bo.filetype == "tex" then
		local save_cursor = vim.fn.getpos(".")
		vim.cmd(":.s/" .. vim.fn.expand("<cword>") .. "/\\\\verb!" .. vim.fn.expand("<cword>") .. "!/g")
		vim.cmd("noh")
		vim.fn.setpos(".", save_cursor)
	end
end, { desc = "Surround with verb block" })

map("n", "<leader>si", function()
	if vim.bo.filetype == "tex" then
		local save_cursor = vim.fn.getpos(".")
		vim.cmd(":.s/" .. vim.fn.expand("<cword>") .. "/\\\\textit{" .. vim.fn.expand("<cword>") .. "}/g")
		vim.cmd("noh")
		vim.fn.setpos(".", save_cursor)
	end
end, { desc = "Surround with verb block" })

map("n", "<leader>sb", function()
	if vim.bo.filetype == "tex" then
		local save_cursor = vim.fn.getpos(".")
		vim.cmd(":.s/" .. vim.fn.expand("<cword>") .. "/\\\\textbf{" .. vim.fn.expand("<cword>") .. "}/g")
		vim.cmd("noh")
		vim.fn.setpos(".", save_cursor)
	end
end, { desc = "Surround with verb block" })

map("n", "<leader>fr", 'ye:%s/<C-R>"/')

map("n", ",e", [[:e <C-R>=expand("%:p:h") . "/" <CR>]], {})
map("n", ",t", [[:tabe <C-R>=expand("%:p:h") . "/" <CR>]], {})
map("n", ",s", [[:split <C-R>=expand("%:p:h") . "/" <CR>]], {})

-- Buffer movement
local nvmap = vim.api.nvim_set_keymap
-- Move to previous/next
nvmap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
nvmap("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
nvmap("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
nvmap("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
-- Goto buffer in position...
nvmap("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
nvmap("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
nvmap("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
nvmap("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
nvmap("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
nvmap("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
nvmap("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
nvmap("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
nvmap("n", "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
nvmap("n", "<A-0>", "<Cmd>BufferLineLast<CR>", opts)
-- Pin/unpin buffer
nvmap("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
nvmap("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

map("n", "<C-p>", "q:", opts)

map("n", "<localleader>t", function()
	print(vim.fn.expand("<cfile>"))
end, opts)

-- visual mode
map("v", "<leader>fr", 'y:%s/<C-R>"/')
map("v", "<leader>lfr", 'y:.s/<C-R>"/')

--- For compiler plugin
--- https://github.com/Zeioth/compiler.nvim
-- Open compiler
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
	"n",
	"<S-F6>",
	"<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
		.. "<cmd>CompilerRedo<cr>",
	{ noremap = true, silent = true }
)

-- Toggle compiler results
vim.api.nvim_set_keymap("n", "<S-F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
--- no neck pain center the current buffer
---
map("n", "<C-c>", [[:NoNeckPain<CR>]], opts)
map("n", "<leader>nc", [[:NoNeckPain<CR>]], opts)
map("n", "<leader>n+", [[:NoNeckPainWidthUp<CR>]],  {noremap = true, silent = true, desc = "NoNeckPainWidthUp" })
map("n", "<leader>n-", [[:NoNeckPainWidthDown<CR>]], {noremap = true, silent = true, desc = "NoNeckPainWidthDown" })



map("n", "<leader>s", function()
        -- check if cmd.vim file exists in pwd
       if  vim.fn.filereadable("cmd.vim") == 1 then
           vim.cmd("source cmd.vim")
       else
           print("cmd.vim not found")
       end
end , {noremap = true, silent = true, desc = "Source cmd.vim" })



-------------------------
--- VISUAL

map("v", "<leader>s(", "c()<ESC>P", {noremap = true, silent = true, desc = "Surround with ()" })
map("v", "<leader>s[", "c[]<ESC>P", {noremap = true, silent = true, desc = "Surround with []" })
map("v", "<leader>s\"", "c\"\"<ESC>P", {noremap = true, silent = true, desc = "Surround with \"\"" })
map("v", "<leader>s\'", "c''<ESC>P", {noremap = true, silent = true, desc = "Surround with ''" })

