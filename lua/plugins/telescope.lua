return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
  },
  opts = {
    pickers = {
      find_files = {
        -- hidden = true,
        -- no_ignore = true,
        -- no_ignore_parent = true,
        -- follow = true,
      },
      -- git_files = {
      --   recurse_submodules = true,
      --   show_untracked = true,
      -- },
      colorscheme = {
        enable_preview = true,
      },
    },
  },
}
