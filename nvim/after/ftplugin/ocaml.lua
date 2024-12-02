
local vim = vim
-- Disable autoindent
vim.opt.autoindent = false

vim.g.indendexpr = ""
-- Disable smart indenting
vim.opt.smartindent = false
vim.opt.cindent = false
vim.filetype.indenting = false
vim.opt.tabstop = 2           -- number of visual spaces per TAB
vim.opt.softtabstop = 2       -- number of spacesin tab when editing
vim.opt.shiftwidth = 2        -- insert 4 spaces on a tab
