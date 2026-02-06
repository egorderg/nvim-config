-- https://github.com/ibhagwan/fzf-lua/blob/main/OPTIONS.md

require("api.pack").add({
	{ src = "https://github.com/ibhagwan/fzf-lua", version = "95f6baea73d0440a28c55d370d424ac645b447a0" },
})

-- TODO: use mise to install rg, fd, bat

require("fzf-lua").setup({
	winopts = {
		-- split = "belowright new",
		height = 0.4,
		width = 1.0,
		row = 1.0,
		col = 0.0,
		border = false,
		backdrop = false,
		preview = {
			scrollbar = false,
			border = false,
		},
	},
	fzf_colors = true,
	buffers = {
		prompt = "Buffers❯ ",
		header = false,
		ignore_current_buffer = false,
	},
})

-- { "<leader>'", function() Snacks.picker.marks() end },
-- { "<leader>`h", function() Snacks.picker.highlights() end },

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "FzfLuaBufNr", { link = "CursorLineNr" })
    vim.api.nvim_set_hl(0, "FzfLuaBufFlagCur", { link = "CursorLineNr" })
		vim.api.nvim_set_hl(0, "FzfLuaBufFlagAlt", { link = "CursorLineNr" })
    vim.api.nvim_set_hl(0, "FzfLuaPathLineNr", { link = "LineNr" })
    vim.api.nvim_set_hl(0, "FzfLuaPathColNr", { link = "LineNr" })
  end,
})
