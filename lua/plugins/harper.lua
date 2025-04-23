-- NOTE: Instructions:
-- https://writewithharper.com/docs/integrations/neovim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls

return {
  require("lspconfig").harper_ls.setup({
    on_attach = function(client, bufnr)
      -- local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
      local filetype = vim.bo[bufnr].filetype
      if filetype == "rst" or filetype == "txt" or filetype == "org" then
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.document_range_formatting = true
      end
    end,
    filetypes = {
      --   "c",
      --   "cpp",
      --   "cs",
      "gitcommit",
      --   "go",
      --   "html",
      --   "java",
      --   "javascript",
      "lua",
      "markdown",
      "nix",
      "python",
      --   "ruby",
      --   "rust",
      --   "swift",
      --   "toml",
      --   "typescript",
      --   "typescriptreact",
      --   "haskell",
      "cmake",
      --   "typst",
      --   "php",
      --   "dart",
      "rst",
      "txt",
      "org",
    },
    settings = {
      ["harper-ls"] = {
        userDictPath = "",
        fileDictPath = "",
        linters = {
          SpellCheck = true,
          SpelledNumbers = false,
          AnA = true,
          SentenceCapitalization = true,
          UnclosedQuotes = true,
          WrongQuotes = false,
          LongSentences = true,
          RepeatedWords = true,
          Spaces = true,
          Matcher = true,
          CorrectNumberSuffix = true,
        },
        codeActions = {
          ForceStable = false,
        },
        markdown = {
          IgnoreLinkTitle = false,
        },
        diagnosticSeverity = "hint",
        isolateEnglish = false,
        dialect = "American",
        -- filetypes = {
        --   "c",
        --   "cpp",
        --   "cs",
        --   "gitcommit",
        --   "go",
        --   "html",
        --   "java",
        --   "javascript",
        --   "lua",
        --   "markdown",
        --   "nix",
        --   "python",
        --   "ruby",
        --   "rust",
        --   "swift",
        --   "toml",
        --   "typescript",
        --   "typescriptreact",
        --   "haskell",
        --   "cmake",
        --   "typst",
        --   "php",
        --   "dart",
        --   "rst",
        --   "txt",
        --   "org",
        -- },
      },
    },
  }),
}
