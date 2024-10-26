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
