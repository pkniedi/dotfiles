local vim = vim
vim.filetype.add({
  pattern = {
    -- For example, force `.myfile` to be parsed as `python`
    ['.*%.mly'] = 'menhir',
  }
})
--set commentstring
vim.cmd([[
  autocmd FileType menhir setlocal commentstring=/*\ %s\ */
]])

-- add ocamllex filetype
vim.filetype.add({
  pattern = {
    ['.*%.mll'] = 'ocamllex',
  }
})

vim.filetype.add({
        extension = {
                i3config = "i3config",
        },
})
vim.filetype.add({
        extension = {
                ll = "llvm",
        },
})
