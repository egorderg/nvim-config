---@class TreesitterConfig
---@field name string

local M = {}

local nerves = require("nerves")
local keymap = require("api.keymap")

local function setup_treewalker_bindings()
	keymap.set_local({ "n", "v" }, "K", function() nerves.call("ts_goto_prev", "@function.outer", "textobjects") end, { desc = "" })
	keymap.set_local({ "n", "v" }, "J", function() nerves.call("ts_goto_next", "@function.outer", "textobjects") end, { desc = "" })
	keymap.set_local({ "n", "v" }, "H", function() nerves.call("ts_swap_prev", "@parameter.inner") end, { desc = "" })
	keymap.set_local({ "n", "v" }, "L", function() nerves.call("ts_swap_next", "@parameter.inner") end, { desc = "" })
	keymap.set_local({ "x", "o" }, "af", function() nerves.call("ts_select", "@function.outer") end, { desc = "" })
	keymap.set_local({ "x", "o" }, "if", function() nerves.call("ts_select", "@function.inner") end, { desc = "" })
	keymap.set_local({ "x", "o" }, "ac", function() nerves.call("ts_select", "@class.outer") end, { desc = "" })
	keymap.set_local({ "x", "o" }, "ic", function() nerves.call("ts_select", "@class.inner") end, { desc = "" })
end

---@param name string
---@param config vim.lsp.Config
function M.setup_lsp(name, config)
	vim.lsp.config(name, config)
	vim.lsp.enable(name)
end

---@param fts string[]
function M.setup_treesitter(fts)
	require('nvim-treesitter').install(fts):wait(300000)

	vim.api.nvim_create_autocmd("FileType", {
		pattern = fts,
		callback = function(args)
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.treesitter.start(args.buf, vim.bo[args.buf].filetype)

			setup_treewalker_bindings()
		end
	})
end

-- TODO: setup local keybindings

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function(args)
		vim.bo[args.buf].formatoptions = "r"
	end,
})

return M

