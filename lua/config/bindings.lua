local keymap = require("api.keymap")
local buffer = require("api.buffer")
local window = require("api.window")
local docs = require("api.docs")

--- nmap - normal map
--- imap - input map
--- vmap - visual map
--- xmap - visual + select map
--- omap - operator pending map
--- cmap - command line map
--- tmap - terminal map

-- Overlord Ideas
-- The quickfix idea for diagnostics, builds, search, ...

-- CTRL to do something -> CTRL-SHIFT to revert
-- ALT for key choords and more features
-- ALT arrows to navigate through windows?
-- script to create a disabled map
-- also a local leader

-- TODO: local leader -> source lua -> create files under filetypes
-- TODO: better help display -> window.show_on_other_window
-- TODO: repeat -> currently its "." -> should be improved what it does because it skip things sometimes
-- TODO: test with all bindings deleted -> raw install
-- TODO: find -> search like in lazyvim
-- TODO: validate g mapping and gcc -> comment should be zc
-- TODO: csharp, ts, js, eslint, prettier (formatting)
-- TODO: finish lua/config/lsp
-- TODO: improve explorer -> maybe snacks with center float?

keymap.nop({ "n", "o", "x" }, "H")
keymap.nop({ "n", "o", "x" }, "J")
keymap.nop({ "n", "o", "x" }, "K")
keymap.nop({ "n", "o", "x" }, "L")
keymap.nop({ "n", "o", "x" }, "X")
keymap.nop({ "n", "o", "x" }, "R")
keymap.nop({ "n", "o", "x" }, "U")
keymap.nop({ "n", "o", "x" }, "g")
keymap.nop({ "n", "o", "x" }, "gw")
keymap.nop({ "n", "o", "x" }, "G")
keymap.nop({ "n", "o", "x" }, "m")
keymap.nop({ "n", "o", "x" }, "M")
keymap.nop({ "n", "o", "x" }, "q")
keymap.nop({ "n", "o", "x" }, "Q")
keymap.nop({ "n", "o", "x" }, "s")
keymap.nop({ "n", "o", "x" }, "S")
keymap.nop({ "n", "o", "x" }, "z")
keymap.nop({ "n", "o", "x" }, "Z")
keymap.nop({ "n", "o", "x" }, "0")
keymap.nop({ "n", "o", "x" }, "`")
keymap.nop({ "n", "o", "x" }, "~")
keymap.nop({ "n", "o", "x" }, "!")
keymap.nop({ "n", "o", "x" }, "@")
keymap.nop({ "n", "o", "x" }, "#")
keymap.nop({ "n", "o", "x" }, "$")
keymap.nop({ "n", "o", "x" }, "^")
keymap.nop({ "n", "o", "x" }, "*")
keymap.nop({ "n", "o", "x" }, "&")
keymap.nop({ "n", "o", "x" }, "-")
keymap.nop({ "n", "o", "x" }, "_")
keymap.nop({ "n", "o", "x" }, "+")
keymap.nop({ "n", "o", "x" }, "=")
keymap.nop({ "n", "o", "x" }, ";")
keymap.nop({ "n", "o", "x" }, ",")
keymap.nop({ "n", "o", "x" }, "'")
keymap.nop({ "n", "o", "x" }, "<")
keymap.nop({ "n", "o", "x" }, ">")
keymap.nop({ "n", "x", "o" }, "(")
keymap.nop({ "n", "x", "o" }, ")")
keymap.nop({ "n", "x", "o" }, "{")
keymap.nop({ "n", "x", "o" }, "}")
keymap.nop({ "n", "x", "o" }, "[")
keymap.nop({ "n", "x", "o" }, "]")

-- F Keys
keymap.nop({ "n", "o", "x", "i" }, "<F1>")
keymap.nop({ "n", "o", "x", "i" }, "<F2>")
keymap.nop({ "n", "o", "x", "i" }, "<F3>")
keymap.nop({ "n", "o", "x", "i" }, "<F4>")
keymap.nop({ "n", "o", "x", "i" }, "<F5>")
keymap.nop({ "n", "o", "x", "i" }, "<F6>")
keymap.nop({ "n", "o", "x", "i" }, "<F7>")
keymap.nop({ "n", "o", "x", "i" }, "<F8>")
keymap.nop({ "n", "o", "x", "i" }, "<F9>")
keymap.nop({ "n", "o", "x", "i" }, "<F10>")
keymap.nop({ "n", "o", "x", "i" }, "<F11>")
keymap.nop({ "n", "o", "x", "i" }, "<F12>")

-- CTRL Keys
keymap.nop({ "i" }, "<C-U>")
keymap.nop({ "i" }, "<C-V>")
keymap.nop({ "i" }, "<C-D>")
keymap.nop({ "n" }, "<C-F>")
keymap.nop({ "n" }, "<C-\\>")
keymap.nop({ "n" }, "<C-B>")
keymap.nop({ "n", "i" }, "<C-K>")
keymap.nop({ "n", "i" }, "<C-W>")
keymap.nop({ "n", "i" }, "<C-E>")
keymap.nop({ "n", "i" }, "<C-Y>")
keymap.nop({ "n", "i" }, "<C-L>")
keymap.nop({ "n", "i" }, "<C-^>")
keymap.nop({ "n", "i" }, "<C-{>")
keymap.nop({ "n", "i" }, "<C-]>")
keymap.nop({ "n", "i" }, "<C-R>")
keymap.nop({ "n", "i" }, "<C-X>")
keymap.nop({ "n", "i" }, "<C-P>")
keymap.nop({ "n", "i" }, "<C-N>")
keymap.nop({ "n", "i" }, "<C-T>")
keymap.nop({ "n", "i" }, "<C-O>")
keymap.nop({ "n", "i" }, "<C-A>")
keymap.nop({ "n", "x" }, "<C-Z>")
keymap.nop({ "n", "x", "i" }, "<C-G>")

-- Command Line
-- <C-c> return from modal command line
-- <C-w> delete word
-- <C-r> insert register
-- <C-n> / <C-p> history
-- <C-f> switch to buffer mode

-- Navigation
-- 1..9
-- C-d
-- C-u
-- hjkl
-- HJKL
-- qQ -> Join/split lines
-- wW
-- eE
-- bB
-- fF
-- tT
-- pP in visual P pastes without yank
-- uU
-- aA
-- iI
-- oO
-- g,G,{count}G
-- r
-- v V C-v
-- y{m},Y
-- d{m},D
-- c{m},C
-- x
-- nN
-- . -> repeat
-- " -> Registers
-- : -> execute command
-- / -> forward search
-- ? -> backward search
-- <> -> jump prev/next
-- TAB/S-Tab -> Shifting
-- zz,zt,zb

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Core
keymap.set({ "n" }, "<C-X><C-Q>", "<cmd>qa<cr>", { desc = "Quit" })
keymap.set_nerve({ "n" }, "<leader><leader>", "picker_smart", { desc = "Smart picker" })
keymap.set_nerve({ "n" }, "<leader>:", "picker_command_history", { desc = "Command history" })
keymap.set_nerve({ "n" }, "'", "picker_marks", { desc = "Marks" })

-- Scrolling
keymap.set({ "n", "x", "o" }, "<C-F>", "20zh", { desc = "Scroll left" })
keymap.set({ "n", "x", "o" }, "<C-K>", "20zl", { desc = "Scroll right" })

-- Jump
keymap.set_nerve({ "n", "x" }, "s", "jump", { desc = "Jump" })
keymap.set({ "n" }, "[b", "<cmd>bp<cr>", { desc = "Prev buffer" })
keymap.set({ "n" }, "]b", "<cmd>bn<cr>", { desc = "Next buffer" })
keymap.set({ "n" }, "<", "<C-O>", { desc = "Jump back" })
keymap.set({ "n" }, ">", "<C-I>", { desc = "Jump forward" })

-- Join/Split
keymap.set({ "n" }, "q", "J", { silent = true, desc = "Join line" })
keymap.set({ "n" }, "Q", "i<CR><Esc>", { silent = true, desc = "Split line" })

-- Shifting
keymap.set({ "v" }, "<Tab>", ">gv", { desc = "Shift right" })
keymap.set({ "v" }, "<S-Tab>", "<gv", { desc = "Shift left" })
keymap.set({ "n" }, "<Tab>", ">>", { desc = "Shift right" })
keymap.set({ "n" }, "<S-Tab>", "<<", { desc = "Shift left" })

-- Search
keymap.set({ "n" }, "<leader>sh", "<cmd>nohlsearch<CR>", { silent = true, desc = "Remove Highlight" })
keymap.set({ "n" }, "<leader>sw", "*", { desc = "Search word" })
keymap.set_nerve({ "n" }, "<leader>sg", "picker_grep", { desc = "Grep" })

-- Editing
keymap.set({ "n" }, "U", "<cmd>redo<CR>", { desc = "Redo" })
keymap.set({ "n", "x" }, "gu", "gu", { desc = "Lower case" })
keymap.set({ "n", "x" }, "gU", "gU", { desc = "Upper case" })
keymap.set({ "n", "x" }, "g~", "g~", { desc = "Toggle case" })

-- Recenter/Folds
keymap.set({ "n", "x" }, "zz", "zz", { desc = "Center cursor" })
keymap.set({ "n", "x" }, "zt", "zt", { desc = "Top cursor" })
keymap.set({ "n", "x" }, "zb", "zb", { desc = "Bottom cursor" })

-- Goto
keymap.set({ "n", "o", "x" }, "G", "G",  { desc = "Go to end of buffer" })
keymap.set({ "n", "o", "x" }, "gg", "gg", { desc = "Go to start of buffer" })
keymap.set({ "n", "o", "x" }, "ga", "^", { desc = "Go to start of line" })
keymap.set({ "n", "o", "x" }, "ge", "$", { desc = "Go to end of line" })
keymap.set({ "n", "o", "x" }, "go", "%", { desc = "Go to other" })

-- Find
keymap.set_nerve({ "n" }, "<leader>ff", "picker_files", { desc =  "Find files" })
keymap.set_nerve({ "n" }, "<leader>fb", "picker_buffers", { desc = "Find buffers" })
keymap.set_nerve({ "n" }, "<leader>fu", "picker_undotree", { desc = "Find undo" })

-- Buffer
keymap.set({ "n", "x" }, "<leader>bw", "<cmd>w<cr>", { desc = "Save" })
keymap.set({ "n", "x" }, "<leader>bW", "<cmd>wall<cr>", { desc = "Save all" })
keymap.set({ "n", "x" }, "<leader>bd", function() buffer.delete_current(false) end, { desc = "Close" })
keymap.set({ "n", "x" }, "<leader>bD", function() buffer.delete_current(true) end, { desc = "Close force" })
keymap.set({ "n", "x" }, "<leader>bo", function() buffer.delete_others(false) end, { desc = "Close others" })

-- Window
keymap.set({ "n", "x" }, "<C-Left>",  "<cmd>vertical resize -5<cr>", { desc = "Decrease width" })
keymap.set({ "n", "x" }, "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase width" })
keymap.set({ "n", "x" }, "<C-Up>",    "<cmd>resize -2<cr>", { desc = "Decrease height" })
keymap.set({ "n", "x" }, "<C-Down>",  "<cmd>resize +2<cr>", { desc = "Increase height" })
keymap.set({ "n", "x" }, "<leader>wh", "<cmd>wincmd h<cr>", { desc = "Left" })
keymap.set({ "n", "x" }, "<leader>wj", "<cmd>wincmd j<cr>", { desc = "Down" })
keymap.set({ "n", "x" }, "<leader>wk", "<cmd>wincmd k<cr>", { desc = "Up" })
keymap.set({ "n", "x" }, "<leader>wl", "<cmd>wincmd l<cr>", { desc = "Right" })
keymap.set({ "n", "x" }, "<leader>ws", "<cmd>split<cr>", { desc = "Split horizontal" })
keymap.set({ "n", "x" }, "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
keymap.set({ "n", "x" }, "<leader>w+", "<cmd>wincmd |<cr>", { desc = "Maximize" })
keymap.set({ "n", "x" }, "<leader>w=", "<cmd>wincmd =<cr>", { desc = "Balance" })
keymap.set({ "n", "x" }, "<leader>wo", function() window.delete_others() end, { desc = "Close others" })
keymap.set({ "n", "x" }, "<leader>wd", function() window.delete_current() end, { desc = "Close" })

-- Tabs
keymap.set({ "n" }, "<leader>tn", "<cmd>tabnew<cr>", { desc = "New" })
keymap.set({ "n" }, "<leader>th", "<cmd>tabprevious<cr>", { desc = "Previous" })
keymap.set({ "n" }, "<leader>tl", "<cmd>tabnext<cr>", { desc = "Next" })
keymap.set({ "n" }, "<leader>td", "<cmd>tabclose<cr>", { desc = "Close" })

-- Files
keymap.set_nerve({ "n", "x" }, "<leader>e", "file_management_open", { desc = "Files" })

-- Docs
keymap.set({ "n", "i" }, "<F1>", function() docs.open() end, { desc = "Open documentation" })

-- Quickfix
keymap.set({ "n" }, "<F2>", "<cmd>copen<cr>", { desc = "Open qflist" })
keymap.set({ "n" }, "<A-F2>", "<cmd>cclose<cr>", { desc = "Close qflist" })
keymap.set({ "n" }, "<F3>", "<cmd>cprev<cr>", { desc = "Prev qflist entry" })
keymap.set({ "n" }, "<F4>", "<cmd>cnext<cr>", { desc = "Next qflist entry" })

-- Help
keymap.set_nerve({ "n" }, "<leader>hh", "picker_help", { desc = "Help" })
