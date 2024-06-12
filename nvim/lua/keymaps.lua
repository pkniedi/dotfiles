local user_functions = require("user-functions")
local builtin = require("telescope.builtin")
local vim = vim
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}

vim.g.maplocalleader = ","
vim.g.mapleader = " "

vim.keymap.set("n", "<C-S-h>", ":bp<CR>", opts)
vim.keymap.set("n", "<C-S-l>", ":bn<CR>", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>sc", [[:set spell!<CR>]], opts)
vim.keymap.set("n", [[<leader>w]], [[:wall<CR>]], opts)
vim.keymap.set("n", [[<leader>noh]], [[:noh<CR>]], opts)

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>lt", [[:ListcharsToggle<CR>]], opts)

vim.keymap.set("n", [[<leader>fo]], [[:Format<CR>]], opts)
vim.keymap.set("n", [[<leader>fw]], [[:FormatWrite<CR>]], opts)
vim.keymap.set("n", [[<leader>ul]], [[:call UltiSnips#RefreshSnippets()<CR>]], opts)
vim.keymap.set("n", [[<leader>?]], [[:Cheatsheet<CR>]], opts)
vim.keymap.set("n", [[<leader>sv]], [[:vsplit<CR>]], opts)
vim.keymap.set("n", [[<leader>ss]], [[:split<CR>]], opts)
vim.keymap.set("n", [[<leader>cc]], [[:close<CR>]], opts)
vim.keymap.set("n", [[<leader>fq]], [[:set formatoptions=jrql<CR>]], opts)
vim.keymap.set("n", [[<leader>tr]], [[:TransparentToggle<CR>]], opts)
vim.keymap.set("n", [[<leader>th]], [[:TSToggle highlight<CR>]], opts)
vim.keymap.set("n", [[<leader>bs]], [[:BufferOrderByBufferNumber<CR>]], opts)
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
vim.keymap.set("n", [[<leader>r]], [[:!quickTry]])
vim.keymap.set("n", [[<leader>td]], [[:UndotreeToggle<CR>]])
vim.keymap.set("n", [[<leader>ha]], [[:lua require("harpoon.mark").add_file()<CR>]])
vim.keymap.set("n", [[<leader>ht]], [[:lua require("harpoon.ui").toggle_quick_menu()<CR>]])
vim.keymap.set("n", [[<leader>mp]], [[:MarkdownPreview<CR>]], opts)
vim.keymap.set("n", [[<leader>gt]], [[:r!gettex -t s -n ]], opts)
vim.keymap.set("n", [[<leader>pv]], [[yi[:!playvid <CR>]], opts)
vim.keymap.set("n", "<leader>oo", ":Outline<CR>", { desc = "Toggle Outline" })
vim.keymap.set("n", "<leader>ol", ":Outline!<CR>", { desc = "Toggle Outline" })
vim.keymap.set("n", [[<leader>wr]], [[:set wrap<CR>]], opts)
vim.keymap.set("n", [[<leader>nw]], [[:set nowrap<CR>]], opts)

-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.keymap.set("i", [[<C-p>]], [[<C-r>]], opts)
vim.keymap.set("n", [[gx]], function()
	user_functions.my_open_url()
end)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", [[<leader>tt]], [[:TodoTelescope<CR>]], opts)
vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>?", "<cmd>Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
vim.keymap.set("n", [[<leader>bd]], [[:bd<CR>]], opts)
vim.keymap.set("n", [[<leader>bn]], [[:bn<CR>]], opts)
vim.keymap.set("n", [[<leader>bp]], [[:bp<CR>]], opts)
vim.keymap.set("n", [[<leader>ou]], [[:!openurls %<CR>]], opts)
vim.keymap.set('n', [[<CR>]], [[gf]], opts)

-- visual
vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
vim.keymap.set("n", "<bs>", ":edit #<cr>", { silent = true })

vim.keymap.set("n", [[<localleader>t]], function()
	user_functions.my_open_url()
end, {desc = "Hello there"})

vim.keymap.set("n", [[<leader>gn]], function()
	print(vim.api.nvim_buf_get_name(0))
end, opts)

vim.keymap.set('n', [[<leader>e]], [[:!./%<CR>]], {desc = "Execute current file."})
