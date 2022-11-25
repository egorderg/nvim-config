local telescope = require("telescope")

telescope.setup {
	defaults = {
    path_display = { "truncate" },
    sorting_strategy = "ascending",
		layout_strategy = vim.o.lines > 60 and "vertical" or "horizontal",
    layout_config = {
			preview_cutoff = 1,
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
				prompt_position = "top",
				mirror = true,
      },
    },
		preview = {
			filesize_limit = 1,
		},
		mappings = {
			n = {
				["<leader>sh"] = "select_vertical",
				["<leader>sv"] = "select_horizontal",
			},
		},
  },
}

require('telescope').load_extension 'file_browser'
