-- NOTE: Instructions:
-- https://writewithharper.com/docs/integrations/neovim
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#harper_ls

-- Skip attaching harper_ls to log-style files (log.txt, Log.txt, gdblog.txt, screenlog0, ...)
local skip_patterns = {
  "log%.txt$",
  "screenlog%.?%d*$",
}

local function is_log_file(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr):lower()
  for _, pat in ipairs(skip_patterns) do
    if name:match(pat) then
      return true
    end
  end
  return false
end

return {
  vim.lsp.config("harper_ls", {
    -- on_attach = function(client, bufnr)
    -- local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
    -- local filetype = vim.bo[bufnr].filetype
    -- if filetype == "rst" or filetype == "txt" or filetype == "org" then
    -- client.resolved_capabilities.document_formatting = true
    -- client.resolved_capabilities.document_range_formatting = true
    -- end
    -- end,
    on_attach = function(client, bufnr)
      if is_log_file(bufnr) then
        vim.schedule(function()
          vim.lsp.buf_detach_client(bufnr, client.id)
        end)
      end
    end,
    filetypes = {
      --   "c",
      --   "cpp",
      --   "cs",
      -- "gitcommit",
      --   "go",
      --   "html",
      --   "java",
      --   "javascript",
      -- "lua",
      "markdown",
      -- "nix",
      -- "python",
      --   "ruby",
      --   "rust",
      --   "swift",
      --   "toml",
      --   "typescript",
      --   "typescriptreact",
      --   "haskell",
      -- "cmake",
      --   "typst",
      --   "php",
      --   "dart",
      "rst",
      "text",
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
  vim.lsp.enable("harper_ls"),
}
