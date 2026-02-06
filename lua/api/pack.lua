local M = {}

local augroup = vim.api.nvim_create_augroup('internal_pack_build_system', { clear = false })

---@class PackConfig
---@field src string
---@field version string
---@field build? function

---@param configs PackConfig[]
function M.add(configs)
	local specs = vim.iter(configs)
		:map(function(c) return { src = c.src, version = c.version, data = { build = c.build } } end):totable()
	
	vim.pack.add(specs, { confirm = false })
end

function M.update_all()
	vim.pack.update()
end

vim.api.nvim_create_autocmd("PackChanged", {
	group = augroup,
	pattern = "*",
	callback = function(e)
		local p = e.data
		local build_task = (p.spec.data or {}).build
		if p.kind ~= "delete" and type(build_task) == 'function' then
			pcall(build_task, p)
		end
	end,
})

return M
