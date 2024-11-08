local vim = vim
local autocmd = vim.api.nvim_create_autocmd
local usercommand = vim.api.nvim_buf_create_user_command
local user_functions = require("user-functions")
local map = vim.api.nvim_buf_set_keymap
local optlocal = vim.opt_local
local cmd = vim.cmd
local api = vim.api


-- Cargo prefixes
map(0, "n", "<leader>cc", ":!cargo check<CR>", {})
map(0, "n", "<leader>cr", ":!cargo run<CR>", {})