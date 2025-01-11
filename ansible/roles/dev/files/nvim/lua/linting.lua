--    https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file

local lint = require("lint")

lint.linters_by_ft = {
	svelte = { "eslint_d" },
	latex = { "chktex" },
	lua = { "luacheck" },
}

-- local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
	-- require("lint").try_lint("mypy"),
})

vim.keymap.set("n", "<leader>l", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
