-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- No mouse support
vim.opt.mouse = ""

-- Cursor hold time
vim.o.updatetime = 200

--LSP stuff

-- Virtual lines
vim.diagnostic.virtual_lines = true
vim.diagnostic.virtual_text = false
-- Disable inlay_hints
-- vim.lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())

-- -- Add filetype
-- vim.filetype.add({
--   extension = {
--     rst = "rst", -- maps .rst files to "rst" filetype
--   },
-- })
