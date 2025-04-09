-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.r",
  command = "set filetype=xml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.autodita",
  command = "set filetype=xml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ditaval",
  command = "set filetype=xml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.dita",
  command = "set filetype=xml",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ditamap",
  command = "set filetype=xml",
})

-- Disable autoformatting per buffer
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "h", "cc", "hpp", "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Disable line numbers for orgmode
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})
