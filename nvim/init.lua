local vim = vim
require("plugins")

local modules = {
	"keymaps",
	"lsp-setup",
	"completion",
	"usercommands",
	"autocommands",
	"autoclose-setup",
	"listchars-setup",
	"formatter-setup",
	"comment-setup",
	"cheatsheet-setup",
	"treesitter",
	"indent-blankline",
	"which-key-setup",
	"cursorline-setup",
	"todo-comment-setup",
	"ufo-setup",
	"oil-setup",
	"lualine-setup",
	"open-url-setup",
	-- "linting",
	"vimtex-setup",
	"colorizer-setup",
	-- "gitsigns-setup",
        "bufferline-setup",
        "render-markdown-setup",
	"user-functions",
        "reload",
	"options",
}

for i = 1, #modules do
	local not_found, err = pcall(require, modules[i])
	if not not_found then
		print(err)
		-- vim.notify("Module '" .. modules[i] .. "' not found!", vim.log.levels.WARN)
	end
end
