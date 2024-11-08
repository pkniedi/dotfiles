-- global user variables
--
local vim = vim

local M = {}
-- M.colorscheme = "tokyonight-storm"
M.colorscheme = "rose-pine"
M.clang_format_files_dir = vim.fn.expand("$HOME") .. "/.config/nvim/.clang-format-files/"
return M
