---@class FloatOptions
---@field title string
---@field width number
---@field height number

---@class BottomOpts
---@field name? string
---@field height? integer
---@field filetype? string
---@field focus? boolean           -- default: true
---@field winfixheight? boolean    -- default: true
---@field winfixbuf? boolean       -- default: true

local M = {}

---@param buf integer
---@param opts FloatOptions
---@return integer
function M.create_float(buf, opts)
	local width = math.floor(opts.width * vim.o.columns)
  local height = math.floor(opts.height * vim.o.lines)
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    row = row,
    col = col,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    title = opts.title,
    title_pos = "center",
  })

	vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, silent = true })

	return win
end

---@param buf integer
---@param opts BottomOpts
---@return integer win
function M.create_bottom(buf, opts)
  local height = opts.height or 10
  local cur_win = vim.api.nvim_get_current_win()

  vim.cmd("split")
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(win, buf)
  vim.cmd("wincmd J")
  vim.api.nvim_win_set_height(0, height)

  if opts.focus == false then
    vim.api.nvim_set_current_win(cur_win)
  end

	vim.wo[win].winfixbuf = true
	vim.wo[win].winfixheight = true

  return win
end

---@param win integer
function M.focus(win)
	vim.api.nvim_set_current_win(win)
end

---@param win integer|nil
---@return boolean
function M.is_valid(win)
	if win == nil then return false end
	return vim.api.nvim_win_is_valid(win)
end

---@param win integer
function M.delete(win)
	pcall(vim.api.nvim_win_close, win, false)
end

function M.delete_current()
  local wins = vim.api.nvim_tabpage_list_wins(0)
	local fixbuf_wins = 0

	for _,win in ipairs(wins) do
		if vim.wo[win].winfixbuf then
			fixbuf_wins = fixbuf_wins + 1
		end
	end

  if #wins - fixbuf_wins > 1 then
    vim.cmd("quit")
  end
end

function M.delete_others()
  local current = vim.api.nvim_get_current_win()
  local wins = vim.api.nvim_tabpage_list_wins(0)

	if vim.wo[current].winfixbuf then
		return
	end

  for _, win in ipairs(wins) do
    if win ~= current and not vim.wo[win].winfixbuf then
			M.delete(win)
    end
  end
end

-- TODO: auto WinResize handling for all windows and validate if the window should not be changed -> winfixwidth?
-- vim.api.nvim_create_autocmd({ "VimResized", "WinResized" }, {
-- 	desc = "Validate fixed windows and keep layout",
-- 	callback = function(args)
-- 		local wins = vim.api.nvim_tabpage_list_wins(0)
--
-- 		for _, win in ipairs(wins) do
-- 			if vim.api.nvim_win_is_valid(win) then
-- 				vim.notify("filetype: " .. vim.bo[vim.api.nvim_win_get_buf(win)].filetype)
-- 				vim.notify("buftype: " .. vim.bo[vim.api.nvim_win_get_buf(win)].buftype)
-- 			end
-- 		end
-- 	end,
-- })

return M
