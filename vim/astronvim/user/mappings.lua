return {
  n = {
    -- user settings
    ["<Leader>,"] = { desc = "⚙Settings" },
    ["<Leader>,r"] = { "<cmd>AstroReload<cr>", desc = "Reload AstroNvim conf" },
    ["<Leader>,e"] = { "<cmd>e ~/.config/nvim/lua/user/<cr>", desc = "User config dir." },

    -- screen control
    ["s"] = { "<Nop>", name = "Screen control" },
    ["sj"] = { "<C-w>j", desc = "Move down" },
    ["sk"] = { "<C-w>k", desc = "Move up" },
    ["sh"] = { "<C-w>h", desc = "Move left" },
    ["sl"] = { "<C-w>l", desc = "Move right" },
    ["sr"] = { "<C-w>r", desc = "Rotate" },
    ["sq"] = { "<cmd>q<cr>", desc = "Quit" },
    ["sQ"] = { "<cmd>bd<cr>", desc = "Quit buffer" },
    ["sv"] = { "<cmd>vsp<cr>", desc = "Split Vertical |" },
    ["ss"] = { "<cmd>sp<cr>", desc = "Split Holizontal -" },
    ["sn"] = { "gt", desc = "Next tab" },
    ["sp"] = { "gT", desc = "Prev tab" },
    ["sN"] = { "<cmd>bn<cr>", desc = "Next Buffer" },
    ["sP"] = { "<cmd>bp<cr>", desc = "Prev Buffer" },
  },
}
