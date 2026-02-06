---@class BufferOptions
---@field name string
---@field filetype string

local M = {}

---@param opts BufferOptions
---@return integer
function M.create_scratch(opts)
	local buf = vim.api.nvim_create_buf(false, true)

  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = opts.filetype
  vim.bo[buf].modifiable = false

	vim.api.nvim_buf_set_name(buf, opts.name)

	return buf
end

---@param buf integer
---@param start integer
---@param end_ integer
---@param lines string[]
function M.set_lines(buf, start, end_, lines)
	local modifiable = vim.bo[buf].modifiable

	if not modifiable then vim.bo[buf].modifiable = true end
	vim.api.nvim_buf_set_lines(buf, start, end_, false, lines)
	if not modifiable then vim.bo[buf].modifiable = false end
end

---@param buf integer|nil
---@return boolean
function M.is_valid(buf)
	if buf == nil then return false end
	return vim.api.nvim_buf_is_valid(buf)
end

---@return integer
function M.get_current_id()
	return vim.api.nvim_get_current_buf()
end

---@return vim.bo|nil
function M.get_current()
	local buf = vim.api.nvim_get_current_buf()

	if not vim.api.nvim_buf_is_valid(buf) then
		return nil
	end

	return vim.bo[buf]
end

---@param force boolean
function M.delete_current(force)
  local cur = vim.api.nvim_get_current_buf()
	local win = vim.api.nvim_get_current_win()

	if vim.wo[win].winfixbuf then
		return
	end

  -- count listed buffers
  local listed = 0
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[b].buflisted then
      listed = listed + 1
    end
  end

  -- if it's the last listed buffer, ignore
  if vim.bo[cur].buflisted and listed <= 1 then
    return
  end

  -- otherwise delete current buffer, keep window by switching first
  local alt = vim.fn.bufnr("#")
  if alt > 0 and vim.bo[alt].buflisted and alt ~= cur then
    vim.cmd("buffer #")
  else
    vim.cmd("bnext")
  end

  pcall(vim.api.nvim_buf_delete, cur, { force = force })
end

---@param force boolean
function M.delete_others(force)
  local cur = vim.api.nvim_get_current_buf()

  -- Collect listed buffers
  local listed = {}
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[b].buflisted then
      table.insert(listed, b)
    end
  end

  -- Nothing to do if current is the only listed buffer
  if vim.bo[cur].buflisted and #listed <= 1 then
    return
  end

  -- 1) Keep windows: point every window in current tabpage at current buffer
  local tab = vim.api.nvim_get_current_tabpage()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
    if vim.api.nvim_win_is_valid(win) then
      local b = vim.api.nvim_win_get_buf(win)
      if b ~= cur then
        vim.api.nvim_win_set_buf(win, cur)
      end
    end
  end

  -- 2) Delete all other listed buffers
  for _, b in ipairs(listed) do
    if b ~= cur then
      pcall(vim.api.nvim_buf_delete, b, { force = force })
    end
  end
end

function M.activate_autosave()
	vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
		desc = "Auto-save normal file buffers on leave/focus lost",
		callback = function(args)
			local buf = args.buf

			if not vim.api.nvim_buf_is_valid(buf) then return end

			-- Only normal file buffers
			if vim.bo[buf].buftype ~= "" then return end
			if not vim.bo[buf].modifiable or vim.bo[buf].readonly then return end
			if not vim.bo[buf].modified then return end

			-- Must have a real filename (not [No Name])
			local name = vim.api.nvim_buf_get_name(buf)
			if name == "" then return end

			-- Optional: only if file exists already (prevents autosave from "creating" files unexpectedly)
			if vim.fn.filereadable(name) == 0 then return end

			-- Write only if needed
			vim.api.nvim_buf_call(buf, function()
				vim.cmd("silent! update")
				vim.notify("Autosave", vim.log.levels.DEBUG, { title = "Autosave" })
			end)
		end,
	})
end

return M
