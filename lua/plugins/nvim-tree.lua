local nerves = require("nerves")

require("api.pack").add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua", version = "v1.15.0" },
})

-- TODO: Use trash as default
-- TODO: pick window color
-- TODO: color line inactive color -> change grayes
-- TODO: when a file is deleted in the tree and the buffer is the last open in the window the layout breaks

require("nvim-tree").setup({
	sync_root_with_cwd = true,
	sort = {
		folders_first = true,
	},
	view = {
		side = "left",
		preserve_window_proportions = false,
		width = {
			min = 40,
			padding = 1,
		},
		cursorline = true,
		number = false,
		signcolumn = "no",
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				border = "none",
				width = 40,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	renderer = {
		group_empty = true,
		full_name = true,
		root_folder_label = false,
		indent_width = 2,
		symlink_destination = true,
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},
	actions = {
		change_dir = {
			enable = false,
			global = false,
		},
	},
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { link = "NormalNC" })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { link = "EndOfBuffer" })
		vim.api.nvim_set_hl(0, "NvimTreeCursorLine",  { link = "Visual" })
		vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#D0D7DE" })
	end
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "NvimTree" then
      vim.wo.winfixbuf = true
      vim.wo.winfixwidth = true
    end
  end,
})

nerves.set_callable("explorer_open_focus", function()
	require("nvim-tree.api").tree.open()
end)

nerves.set_callable("explorer_close", function()
	require("nvim-tree.api").tree.close()
end)

nerves.set_statusline("NvimTree", {
	active = function () return vim.fn.getcwd() end,
	inactive = function () return vim.fn.getcwd() end,
})
