---@class StatuslineNerve
---@field active function(): string
---@field inactive function(): string

---@alias CallableNerve
---| "jump"
---| "file_management_open"
---| "picker_smart"
---| "picker_files"
---| "picker_buffers"
---| "picker_command_history"
---| "picker_marks"
---| "picker_undotree"
---| "picker_grep"
---| "picker_lsp_definitions"
---| "picker_lsp_declarations"
---| "picker_lsp_references"
---| "picker_lsp_implementations"
---| "picker_lsp_symbols"
---| "picker_lsp_workspace_symbols"
---| "picker_help"
---| "ts_select"
---| "ts_goto_prev"
---| "ts_goto_next"
---| "ts_swap_prev"
---| "ts_swap_next"

local M = {}

---@type table<CallableNerve, function>
local callables = {}
---@type string[]
local disabled_autocomplete_ft = {}
---@type table<string, StatuslineNerve>
local statusline_ft = {}

---@param ft string
function M.is_autocomplete_disabled(ft)
	return vim.tbl_contains(disabled_autocomplete_ft, ft)
end

---@param ft string
function M.disable_autocomplete(ft)
	table.insert(disabled_autocomplete_ft, ft)
end

---@param ft string
---@return StatuslineNerve|nil
function M.get_statusline(ft)
	return statusline_ft[ft]
end

---@param ft string
---@param config StatuslineNerve
function M.set_statusline(ft, config)
	statusline_ft[ft] = config
end

---@param name CallableNerve
---@param fn function
function M.set_callable(name, fn)
	callables[name] = fn
end

---@param name CallableNerve
function M.call(name, ...)
  local fn = callables[name]
  if not fn then
    vim.notify(("Nerve '%s' is not registered"):format(name), vim.log.levels.INFO)
    return
  end

  return fn(...)
end

return M
