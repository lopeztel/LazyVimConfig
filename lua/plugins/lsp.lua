return {
  --NOTE: Enable default configs for the lsp, use locally installed version
  vim.lsp.enable("clangd"),

  -- Modify Mason configuration to exclude clangd
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Filter out clangd from ensure_installed if present
      opts.ensure_installed = vim.tbl_filter(function(tool)
        return tool ~= "clangd"
      end, opts.ensure_installed or {})
    end,
  },
}
