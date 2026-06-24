local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument = capabilities.textDocument or {}
capabilities.textDocument.semanticTokens = {
  dynamicRegistration = false,
  requests = {
    range = false,
    full = true,
  },
  tokenTypes = {
    "namespace",
    "class",
    "enum",
    "interface",
    "struct",
    "typeParameter",
    "type",
    "parameter",
    "variable",
    "property",
    "enumMember",
    "decorator",
    "event",
    "function",
    "method",
    "macro",
    "label",
    "comment",
    "string",
    "keyword",
    "number",
    "regexp",
    "operator",
  },
  tokenModifiers = {
    "declaration",
    "definition",
    "readonly",
    "static",
    "deprecated",
    "abstract",
    "async",
    "modification",
    "documentaton",
    "defaultLibrary",
  },
  formats = { "relative" },
}

--Enable formatting
capabilities.textDocument.formatting = {
  dynamicRegistration = false,
}

-- Enable folding range support
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

vim.lsp.config["dts-lsp"] = {
  -- Command and arguments to start the server.
  cmd = { "devicetree-language-server", "--stdio" },
  -- Filetypes to automatically attach to.
  filetypes = { "dts", "dtsi", "overlay" },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  -- root_markers = { "zephyr", ".git", "." },
  root_markers = { "zephyr" },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    devicetree = {
      defaultIncludePaths = {
        -- defaults
        "./zephyr/dts",
        "./zephyr/dts/arm",
        "./zephyr/dts/arm64",
        "./zephyr/dts/riscv",
        "./zephyr/dts/common",
        "./zephyr/include",
        -- nordic specific
        "./zephyr/dts/vendor/nordic",
        "./zephyr/dts/arm/nordic",
        -- "./zephyr/boards/nordic/nrf54l15dk",
        -- "./zephyr/boards/nordic/nrf54lm20dk",
        "./zephyr/boards/nordic/nrf54h20dk",
        -- ncs specific
        "./nrf/dts/arm/nordic",
        "./nrf/dts/common/nordic",
      },
      cwd = "${workspaceFolder}",
      defaultBindingType = "Zephyr",
      defaultZephyrBindings = {
        "./zephyr/dts/bindings",
      },
      autoChangeContext = true,
      allowAdhocContexts = true,
      contexts = {},
    },
  },
  capabilities = capabilities,
}

return {
  vim.lsp.enable("dts-lsp"),
}
