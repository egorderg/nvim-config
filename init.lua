local opt = vim.opt
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.hidden = true
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
opt.updatetime = 300
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.sessionoptions = "buffers,curdir,folds,tabpages,winsize"

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

require('plugins')
require('mappings')

local lush_ok, lush = pcall(require, 'lush')
if lush_ok then
	lush(require('theme'))
end
