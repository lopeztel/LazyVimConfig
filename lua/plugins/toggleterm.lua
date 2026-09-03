return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Leave terminal-insert mode without using Ctrl-\
    vim.keymap.set("t", "<C-o>", [[<C-\><C-n>]], {
      noremap = true,
      silent = true,
      desc = "Terminal normal mode",
    })
  end,
}
