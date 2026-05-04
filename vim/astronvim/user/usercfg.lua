local options = {
  smartindent = true,
  wrap = true,
}

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = true

local lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})
