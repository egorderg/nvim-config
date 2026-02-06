local keymap = require("api.keymap")

vim.opt.completeopt = "fuzzy,menuone,noselect"
vim.opt.complete = ".,w,b" -- completion sources
vim.opt.shortmess:append("c")
vim.opt.pumheight = 10

keymap.set({ "i" }, "<C-j>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { desc = "Move down in completion", expr = true, silent = true })

keymap.set({ "i" }, "<C-k>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { desc = "Move up in completion", expr = true, silent = true })
