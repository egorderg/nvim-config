---@class BindOptions
---@field desc string
---@field silent? boolean
---@field expr? boolean

local M = {}

---@param modes string[]
---@param lhs string
function M.nop(modes, lhs)
	vim.keymap.set(modes, lhs, "<nop>")
end

---@param modes string[]
---@param lhs string
---@param rhs string|function
---@param opts BindOptions
function M.set(modes, lhs, rhs, opts)
	vim.keymap.set(modes, lhs, rhs, { desc = opts.desc, silent = opts.silent, expr = opts.expr })
end

---@param modes string[]
---@param lhs string
---@param rhs string|function
---@param opts BindOptions
function M.set_local(modes, lhs, rhs, opts)
	vim.keymap.set(modes, lhs, rhs, { desc = opts.desc, silent = opts.silent, expr = opts.expr, buffer = true })
end

---@param modes string[]
---@param lhs string
---@param name CallableNerve
---@param opts BindOptions
function M.set_nerve(modes, lhs, name, opts)
	M.set(modes, lhs, function()
		require("nerves").call(name)
	end, { desc = opts.desc, expr = opts.expr, silent = false })
end

---@param modes string[]
---@param lhs string
---@param name CallableNerve
---@param opts BindOptions
function M.set_local_nerve(modes, lhs, name, opts)
	M.set(modes, lhs, function()
		require("nerves").call(name)
	end, { desc = opts.desc, expr = opts.expr, silent = false })
end

return M
