local vim = vim
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_buf_set_keymap

-- search markdown links
map(0, "n", "<Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)')<CR>", opts)
map(0, "n", "<S-Tab>", "<Cmd>call search('\\[[^]]*\\]([^)]\\+)', 'b')<CR>", opts)
