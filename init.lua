-- TODO: Validate keymap with lazyvim
-- TODO: Neogit
-- TODO: Orgmode -> Org Agenda should be the dashboard
-- TODO: minibuffer -> replace snacks
-- TODO: Bookmarks (Marks)
-- TODO: Registers
-- TODO: Jumps
-- TODO: Mappings for picker/filetree, also optimize filetree with only necesary actions
-- TODO: Project Management
-- TODO: Task Runner with support for mise.toml should use qflist -> build, test
			-- compile mode should use mise -> auto build when file changes -> create a buffer -> compile output or something
			-- also the workflow with compile mode should be -> compile auto -> validate -> change -> compile
-- TODO: Terminal -> only terminal in new tab?
-- TODO: Help -> <leader>h... -> checkhealth
-- TODO: which-key or mapping as a help like in emacs? -> <leader>hk
-- TODO: use qflist for diagnostics, TODOs, ... add more to this and iterate with F3-F4
			-- find about how to improve work with qflist like cdo to change occurences in multiple files
			-- pass compile errors to qflist
			-- F3-F4 to navigate qflist -> also helpful with search results
			-- also leverage the qflist stack to save multiple things -> switch lists and iterate through problems based on the current list
			-- also add way to delete/add new things to qflist
			-- show current qflist inside statusline??? -> switch with custom Snacks picker -> e.g.,  Compile (5), Diagnostics (10)
			-- F2, F3, F4

-- TODO: better search replace in file -> there is something like cgn, i thought about C-N with "Pn" -> paste without yank and next
-- TODO: better substitute -> like a keybinding? should work in buffer and selection

-- vim.opt  -- global defaults
-- vim.bo   -- buffer-local options
-- vim.wo   -- window-local options

-- vim.g  -- global state
-- vim.b  -- per-buffer state
-- vim.w  -- per-window state

-- Disable builtin plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_banner = 0
vim.g.loaded_gzip = true
vim.g.loaded_rrhelper = true
vim.g.loaded_tarPlugin = true
vim.g.loaded_zipPlugin = true
vim.g.loaded_netrwPlugin = true
vim.g.loaded_netrwFileHandlers = true
vim.g.loaded_netrwSettings = true
vim.g.loaded_2html_plugin = true
vim.g.loaded_vimballPlugin = true
vim.g.loaded_getscriptPlugin = true
vim.g.loaded_logipat = true
vim.g.loaded_tutor_mode_plugin = true
vim.g.loaded_matchit = true
vim.g.no_plugin_maps = true

-- Window
vim.opt.winheight = 20
vim.opt.winheight = 20
vim.opt.winminwidth = 20
vim.opt.winminwidth = 20
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 5

vim.opt.wrap = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.modeline = false
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.breakindent = true

vim.opt.updatetime = 500

vim.opt.shada = ""

-- Yank Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function () vim.highlight.on_yank() end,
})

require("api.buffer").activate_autosave()

require("config.mise")
require("config.neovide")
require("config.bindings")
require("config.completion")
require("config.lsp")
require("config.theme")

-- Plugins
require("plugins.flash")
require("plugins.mini")
require("plugins.snacks")
-- require("plugins.minibuffer")
require("plugins.treesitter")
require("plugins.theme-github")

require("ft.markdown")
require("ft.lua")
