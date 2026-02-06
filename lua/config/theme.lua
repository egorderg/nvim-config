vim.opt.termguicolors = true
vim.opt.background = "light"

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  end,
})
