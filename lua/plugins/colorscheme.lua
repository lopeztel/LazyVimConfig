-- nord

--TODO: Check if this needs to be removed (ONLY APPLIES TO NORD)
-- Disable LSP semantic tokens by default to fix issue with theme colors https://github.com/shaunsingh/nord.nvim/issues/143
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

vim.g.nord_borders = true
vim.g.nord_contrast = true
vim.g.nord_disable_background = true
vim.g.nord_enable_sidebar_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

return {
  { "shaunsingh/nord.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}

--Tokyonight
-- return {
--   "LazyVim/LazyVim",
--   opts = {
--     colorscheme = "tokyonight-storm",
--   },
-- }
