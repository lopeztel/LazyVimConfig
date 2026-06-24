return {
  "stevearc/conform.nvim",
  optional = true,
  enabled = true,
  opts = {
    formatters_by_ft = {
      -- Add uncrustify to the appropriate filetypes
      -- c = { "uncrustify", "clangformat" },
      c = { "uncrustify" },
      -- cpp = { "uncrustify", "clangformat" },
      cpp = { "uncrustify" },
      -- Add any other filetypes that you want to format with uncrustify
      markdown = { "prettier" },
    },
    formatters = {
      uncrustify = {
        -- Specify the path to your local uncrustify binary if needed
        -- command = vim.fn.expand("~/path/to/uncrustify"),
        -- Or if it's in your PATH, just leave the default:
        command = "uncrustify",

        -- You can also specify additional arguments if needed
        -- args = { "-c", vim.fn.expand("~/path/to/uncrustify.cfg") },
        args = function()
          local cwd = vim.fn.getcwd()
          local config_path = cwd .. "/uncrustify.cfg"
          local buf = vim.api.nvim_get_current_buf()
          local bufname = vim.api.nvim_buf_get_name(buf)

          -- Check if the config file exists in the current directory
          if vim.fn.filereadable(config_path) == 1 then
            -- Read from stdin (conform pipes the buffer in) and write to stdout.
            -- Do NOT pass "-f bufname": that makes uncrustify read the on-disk
            -- file instead of the buffer, so unsaved edits get reverted on :w.
            -- "-l c" gives the language hint that "-f" would otherwise supply.
            return { "-c", config_path, "-l", "c" }
          else
            return nil
          end
        end,
        -- Reload buffer after formatting
        -- post_process = function()
        -- vim.cmd("edit!")
        -- vim.api.nvim_command("edit!")

        -- vim.api.nvim_buf_call(0, function()
        --   vim.api.nvim_command("edit!")
        -- end)
        -- end,
        -- stdin = true,
      },
      clangformat = {
        command = "clang-format",
      },
      prettier = {
        prepend_args = {
          "--prose-wrap",
          "always",
          "--print-width",
          "80",
        },
      },
    },
  },
}
