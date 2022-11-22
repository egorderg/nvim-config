local telescope = require("telescope")

telescope.setup {
	defaults = {
    path_display = { "truncate" },
    sorting_strategy = "ascending",
		layout_strategy = vim.o.lines > 40 and "vertical" or "horizontal",
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
		file_ignore_patterns = {
			"node_modules",
		},
  },
}
