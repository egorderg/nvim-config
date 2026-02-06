local buffer = require("api.buffer")

vim.fn.sign_define("UserMark", { text = "●", texthl = "DiagnosticHint" })

local function place_mark_sign(buf, line)
  vim.fn.sign_place(0, "marks", "UserMark", buf, { lnum = line, priority = 10 })
end

local function clear_mark_signs(buf)
  vim.fn.sign_unplace("marks", { buffer = buf })
end

local function ask_mark()
  local m = vim.fn.input("Mark (a–z): ")

  if m == "" then
    return nil
  end

  m = m:sub(1, 1)

  if not m:match("[a-zA-Z]") then
    vim.notify("Invalid mark", vim.log.levels.WARN)
    return nil
  end

  return m
end

vim.api.nvim_create_user_command("MarkToggle", function()
	local mark = ask_mark()

	if not mark then return end

	local buf = buffer.get_current_id()
  local cur = vim.fn.line(".")
  local pos = vim.fn.getpos("'" .. mark)

  clear_mark_signs(buf)

  if pos[2] == cur then
    vim.cmd("delmarks " .. mark)
  else
    vim.cmd("mark " .. mark)
    place_mark_sign(buf, cur)
  end
end, {})
