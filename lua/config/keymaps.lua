-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<F5>", function()
  require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "cpp" }, coreclr = { "cs" } })
end, { desc = "Load vscode config" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- Emacs bindings and related to https://github.com/LazyVim/LazyVim/discussions/163
map("n", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("v", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
-- map("n", "<A-k>", "<esc>gk", { desc = "Move up" })
-- map("n", "<A-j>", "<esc>gj", { desc = "Move down" })
-- map("i", "<A-k>", "<esc>gk", { desc = "Move up" })
-- map("i", "<A-j>", "<esc>gj", { desc = "Move down" })
-- map("v", "<A-k>", "<esc>gk", { desc = "Move up" })
-- map("v", "<A-j>", "<esc>gj", { desc = "Move down" })
