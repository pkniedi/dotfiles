local user_functions = require("user-functions")
local builtin = require("telescope.builtin")
local util_funcs = require("utility-functions")
local vim = vim
local setkeymap = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

vim.g.maplocalleader = ","
vim.g.mapleader = " "
setkeymap("n", "<C-S-h>", ":bp<CR>", opts)
setkeymap("n", "<C-S-l>", ":bn<CR>", opts)
setkeymap("n", "<C-j>", "<C-w>j", opts)
setkeymap("n", "<C-h>", "<C-w>h", opts)
setkeymap("n", "<C-k>", "<C-w>k", opts)
setkeymap("n", "<C-l>", "<C-w>l", opts)
setkeymap("n", "<leader>sc", [[:set spell!<CR>]], opts)
setkeymap("n", [[<leader>w]], [[:wall<CR><CR>]], opts)
setkeymap("n", [[<leader>noh]], [[:noh<CR>]], opts)
setkeymap("n", [[gf]], [[:e <cfile><CR>]], { desc = "Goto file" })
-- setkeymap("n", [[gf]], function()
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
setkeymap("n", "<leader>ff", builtin.find_files, opts)
setkeymap("n", "<leader>fg", builtin.live_grep, opts)
setkeymap("n", "<leader>fb", builtin.buffers, opts)
setkeymap("n", "<leader>fh", builtin.help_tags, opts)
setkeymap("n", "<leader>lt", [[:ListcharsToggle<CR>]], opts)
setkeymap("n", [[<leader>fo]], [[:Format<CR>]], opts)
setkeymap("n", [[<leader>fw]], [[:FormatWrite<CR>]], opts)
setkeymap("n", [[<leader>ul]], [[:call UltiSnips#RefreshSnippets()<CR>]], opts)
setkeymap("n", [[<leader>?]], [[:Cheatsheet<CR>]], opts)
setkeymap("n", [[<leader>ss]], [[:split<CR>]], opts)
setkeymap("n", [[<leader>cc]], [[:close<CR>]], opts)
setkeymap("n", [[<leader>fq]], [[:set formatoptions=jrql<CR>]], opts)
setkeymap("n", [[<leader>tr]], [[:TransparentToggle<CR>]], opts)
setkeymap("n", [[<leader>th]], [[:TSToggle highlight<CR>]], opts)
setkeymap("n", [[<leader>bs]], [[:BufferOrderByBufferNumber<CR>]], opts)
setkeymap("n", "<space>e", vim.diagnostic.open_float)
setkeymap("n", "[d", vim.diagnostic.goto_prev)
setkeymap("n", "]d", vim.diagnostic.goto_next)
setkeymap("n", "<space>q", vim.diagnostic.setloclist)
setkeymap("n", [[<leader>r]], [[:!quickTry]])
setkeymap("n", [[<leader>td]], [[:UndotreeToggle<CR>]])
setkeymap("n", [[<leader>ha]], [[:lua require("harpoon.mark").add_file()<CR>]])
setkeymap("n", [[<leader>ht]], [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]])
setkeymap("n", [[<leader>mp]], [[:MarkdownPreview<CR>]], opts)
setkeymap("n", [[<leader>gt]], [[:r!gettex -t s -n ]], opts)
setkeymap("n", [[<leader>pv]], [[yi[:!playvid <CR>]], opts)
setkeymap("n", "<leader>oo", ":Outline<CR>", { desc = "Toggle Outline" })
setkeymap("n", "<leader>ol", ":Outline!<CR>", { desc = "Toggle Outline" })
setkeymap("n", [[<leader>wr]], [[:set wrap<CR>]], opts)
setkeymap("n", [[<leader>nw]], [[:set nowrap<CR>]], opts)
setkeymap("i", [[<C-p>]], [[<C-r>]], opts)
setkeymap("n", [[gx]], function()
	user_functions.my_open_url()
end)
setkeymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
setkeymap("n", [[<leader>tt]], [[:TodoTelescope<CR>]], opts)
setkeymap("n", "<leader><space>", "<cmd>Telescope buffers<cr>")
setkeymap("n", "<leader>?", "<cmd>Telescope oldfiles<cr>")
setkeymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
setkeymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
setkeymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
setkeymap("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
setkeymap("n", [[<leader>bd]], [[:bd<CR>]], opts)
setkeymap("n", [[<leader>bn]], [[:bn<CR>]], opts)
setkeymap("n", [[<leader>bp]], [[:bp<CR>]], opts)
setkeymap("n", [[<leader>ou]], [[:!openurls %<CR>]], opts)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		setkeymap("n", "gD", vim.lsp.buf.declaration, opts)
		setkeymap("n", "gd", vim.lsp.buf.definition, opts)
		setkeymap("n", "K", vim.lsp.buf.hover, opts)
		setkeymap("n", "gi", vim.lsp.buf.implementation, opts)
		-- setkeymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		setkeymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- setkeymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		setkeymap("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		setkeymap("n", "<space>D", vim.lsp.buf.type_definition, opts)
		setkeymap("n", "<space>rn", vim.lsp.buf.rename, opts)
		setkeymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		setkeymap("n", "gr", vim.lsp.buf.references, opts)
		setkeymap("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
setkeymap("n", "<bs>", ":edit #<cr>", { silent = true })
setkeymap("n", [[<localleader>t]], function()
	user_functions.my_open_url()
end, { desc = "Hello there" })
setkeymap("n", [[<leader>gn]], function()
	print(vim.api.nvim_buf_get_name(0))
end, opts)
setkeymap("n", [[<leader>ee]], [[:!./%<CR>]], { desc = "Execute current file." })
setkeymap("n", [[<leader>ea]], [[:!./% ]], { desc = "Execute current file with arguments." })
setkeymap("n", [[<leader>gw]], [[:r! getwiki ]], opts)
setkeymap("n", [[<CR>]], function()
	user_functions.my_open_url()
end, opts)

setkeymap("n", [[<localleader>tt]], function()
	util_funcs.create_default_makefile()
end, { desc = "" })
-- make keymaps
setkeymap("n", [[<leader>mm]], [[:!make<CR>]], { desc = "run make" })
setkeymap("n", [[<leader>ma]], [[:!make]], { desc = ":!" })
setkeymap("n", [[<leader>mt]], [[:!make test<CR>]], { desc = ":!make test<CR>" })

setkeymap("n", [[<leader>ss]], [[:SubSQL<CR>]], { desc = "Substitute SQL statements" })

-- visual mode
setkeymap("v", "p", '"_dP')
setkeymap("v", "<", "<gv", opts)
setkeymap("v", ">", ">gv", opts)

vim.keymap.set("n", "<leader>sv", function()
	if vim.bo.filetype == "tex" then
		local save_cursor = vim.fn.getpos(".")
		vim.cmd(":.s/" .. vim.fn.expand("<cword>") .. "/\\\\verb!" .. vim.fn.expand("<cword>") .. "!/g")
                vim.cmd("noh")
		vim.fn.setpos(".", save_cursor)
	end
end, { desc = "Surround with verb block" })

vim.keymap.set("n", "<leader>si", function()
	if vim.bo.filetype == "tex" then
		local save_cursor = vim.fn.getpos(".")
		vim.cmd(":.s/" .. vim.fn.expand("<cword>") .. "/\\\\textit{" .. vim.fn.expand("<cword>") .. "}/g")
                vim.cmd("noh")
		vim.fn.setpos(".", save_cursor)
	end
end, { desc = "Surround with verb block" })

vim.keymap.set("n", "<leader>sb", function()
	if vim.bo.filetype == "tex" then
		local save_cursor = vim.fn.getpos(".")
		vim.cmd(":.s/" .. vim.fn.expand("<cword>") .. "/\\\\textbf{" .. vim.fn.expand("<cword>") .. "}/g")
                vim.cmd("noh")
		vim.fn.setpos(".", save_cursor)
	end
end, { desc = "Surround with verb block" })
