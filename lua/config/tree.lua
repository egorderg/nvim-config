function grep_at_current_node()
	local node = require('nvim-tree.lib').get_node_at_cursor()
	if not node then return end

	require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
end

require('nvim-tree').setup {
	sort_by = "case_sensitive",
	view = {
		width = 40,
		mappings = {
			list = {
				{ key = "<leader>tg", cb = ':lua grep_at_current_node()<cr>', mode = "n" }
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "c",
					staged = "✓",
					unmerged = "",
					renamed = "r",
					untracked = "a",
					deleted = "d",
					ignored = "◌",
				},
			},
		}
	},
	filters = {
		dotfiles = true,
	},
}
