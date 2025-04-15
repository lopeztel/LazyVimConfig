-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Deal with some files as xml
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.r", "*.autodita", "*.ditaval", "*.dita", "*.ditamap" },
  command = "set filetype=xml",
})

-- Disable autoformatting per buffer
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "h", "cc", "hpp", "cpp" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Disable line numbers for some files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "org", "rst", "md" },
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

-- Enable spelling for some files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "org", "rst", "md" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" } -- You can change to your preferred language
  end,
})
