local nerves = require("nerves")

-- Versions of the parsers are pinned inside nvim-treesitter, no need for pinned treesitter parsers too
require("api.pack").add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "568ede7e79172a0fe7c9d631454a97ad968deaf2",
		build = function(_)
			-- Update parsers so it stay in sync with the library
			vim.cmd("TSUpdate")
		end,
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		version = "52bda74e087034408e2d563cb4499c1601038f9d",
	},
})

require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		include_surrounding_whitespace = true,
	},
	move = {
		set_jumps = true,
	},
})

nerves.set_callable("ts_select", require("nvim-treesitter-textobjects.select").select_textobject)
nerves.set_callable("ts_goto_prev", require("nvim-treesitter-textobjects.move").goto_previous_start)
nerves.set_callable("ts_goto_next", require("nvim-treesitter-textobjects.move").goto_next_start)
nerves.set_callable("ts_swap_prev", require("nvim-treesitter-textobjects.swap").swap_previous)
nerves.set_callable("ts_swap_next", require("nvim-treesitter-textobjects.swap").swap_next)
