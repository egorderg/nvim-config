local M = {}

local window = require("api.window")
local buffer = require("api.buffer")

---@type integer|nil
local last_win = nil

---@param info string[]
---@param diags string[]
local function create_window(info, diags)
	if window.is_valid(last_win) then
		return
	end

	local buf = buffer.create_scratch({
		name = "Documentation",
		filetype = "markdown"
	})

	buffer.set_lines(buf, 0, #diags, diags)
	buffer.set_lines(buf, #diags, -1, info)

	last_win = window.create_float(buf, {
		title = "Documentation",
		width = 0.5,
		height = 0.7,
	})
end

---@param diags vim.Diagnostic[]
---@return string[]
local function format_diags(diags)
  if #diags == 0 then
    return {}
  end

  local sev_name = {
    [vim.diagnostic.severity.ERROR] = "Error",
    [vim.diagnostic.severity.WARN]  = "Warn",
    [vim.diagnostic.severity.INFO]  = "Info",
    [vim.diagnostic.severity.HINT]  = "Hint",
  }

  local out = {}
  for _, d in ipairs(diags) do
    local s = sev_name[d.severity] or "Diag"
    local src = d.source and (" (%s)"):format(d.source) or ""
    local msg = (d.message or ""):gsub("\r", ""):gsub("\n", " ")
    out[#out + 1] = ("- **%s**%s: %s"):format(s, src, msg)
  end
  out[#out + 1] = ""
  return out
end

function M.open()
  local params = vim.lsp.util.make_position_params(0, "utf-16")
	local diags = vim.diagnostic.get(0, {
		lnum = vim.fn.line(".") - 1
	})

	vim.lsp.buf_request(0, "textDocument/hover", params, function(err, result, ctx)
		local client = vim.lsp.get_client_by_id(ctx.client_id)

		if client == nil or not client:supports_method("textDocument/hover") then
			vim.notify("Documentation not supported", vim.log.levels.INFO)
			return
		end

		if err then
			vim.notify(("Documentation: %s_"):format(err.message or tostring(err)), vim.log.levels.ERROR)
			return
		end

		if not (result and result.contents) then
			vim.notify("Documentation not found", vim.log.levels.INFO)
			return
		end

		local info_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)

		if vim.tbl_isempty(info_lines) then
			vim.notify("Documentation not found", vim.log.levels.INFO)
			return
		end

		local diag_lines = format_diags(diags)

		create_window(info_lines, diag_lines)
	end)
end


return M
