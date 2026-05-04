local options = {
  smartindent = true,
  wrap = true,
}

local servers = {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
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
