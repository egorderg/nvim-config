local opt = vim.opt
local g = vim.g

g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 255
g.netrw_liststyle = 3

opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 2
opt.termguicolors = true
opt.hlsearch = true
opt.ignorecase = true
opt.breakindent = true
opt.updatetime = 50
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.sessionoptions = "blank,buffers,curdir,folds,tabpages,winsize"

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

require('plugins')
require('mappings')

-- Theme

-- tokyonight
-- tokyonight-night 
-- tokyonight-storm 
-- tokyonight-day   
-- tokyonight-moon  

-- catppuccin
-- catppuccin-latte
-- catppuccin-frappe
-- catppuccin-macchiato
-- catppuccin-mocha
vim.cmd 'colorscheme catppuccin'

-- local lush_ok, lush = pcall(require, 'lush')
-- if lush_ok then
-- 	lush(require('theme'))
-- end
