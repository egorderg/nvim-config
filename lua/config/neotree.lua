require('neo-tree').setup {
	close_if_last_window = true,
	enable_git_status = true,
	enable_diagnostics = true,
	source_selector = {
		winbar = true,
		content_layout = 'center',
		tab_labels = {
			filesystem = ' File',
			git_status = ' Git',
		},
	},
	default_component_configs = {
		indent = {
			padding = 1,
		},
		icon = {
			default = '',
		},
	},
	window = {
		width = 40,
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = "open_default",
		use_libuv_file_watcher = true,
		commands = {
			delete = function(state)
				local path = state.tree:get_node().path
				vim.fn.system({ 'gio', 'trash', vim.fn.fnameescape(path) })

				require('neo-tree.sources.manager').refresh(state.name)
			end,
		}
	},
	event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
}
