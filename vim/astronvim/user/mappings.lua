return {
  n = {
    ["<Leader>r"] = { "<cmd>AstroReload<cr>", desc = "Reload AstroNvim conf" },

    ["s"] = { "<Nop>", name = "Screen control" },
    ["sj"] = { "<C-w>j", desc = "Move down" },
    ["sk"] = { "<C-w>k", desc = "Move up" },
    ["sh"] = { "<C-w>h", desc = "Move left" },
    ["sl"] = { "<C-w>l", desc = "Move right" },
    ["sr"] = { "<C-w>r", desc = "Rotate" },
    ["sq"] = { "<cmd>q<cr>", desc = "Quit" },
    ["sv"] = { "<cmd>vsp<cr>", desc = "Split Vertical |" },
    ["ss"] = { "<cmd>sp<cr>", desc = "Split Holizontal -" },
    ["sn"] = { "gt", desc = "Next tab" },
    ["sp"] = { "gT", desc = "Prev tab" },
  },
}
