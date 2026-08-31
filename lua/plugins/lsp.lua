-- Root cause: this repo's compile_commands.json invokes cross compilers
-- (riscv32-unknown-elf-gcc, arm-none-eabi-gcc) that live outside clangd's
-- allowed-driver allowlist. Without --query-driver, clangd never asks these
-- compilers for their real default system include dirs (e.g. the
-- <target>/include-fixed dir with machine-generated header fixups); it just
-- guesses standard cross-gcc layout paths instead, which is incomplete and
-- causes clangd to silently drop headers, breaking symbol resolution in
-- files like green0_can_fsm.c. Glob patterns only (no absolute/user paths)
-- so this keeps working regardless of where the toolchain is installed.
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--query-driver=**/riscv32-unknown-elf-*,**/arm-none-eabi-*,**/*-gcc,**/*-g++",
  },
})

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
