
local vim = vim
-- Disable autoindent
vim.opt.autoindent = false

vim.g.indendexpr = ""
-- Disable smart indenting
vim.opt.smartindent = false
vim.opt.cindent = false
vim.filetype.indenting = false

vim.notify("Smart indenting disabled", vim.log.levels.WARN)
