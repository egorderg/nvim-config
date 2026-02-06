-- TODO: replace with minibuffer and the new extui
local nerves = require("nerves")

require("api.pack").add({
	{ src = "https://github.com/folke/snacks.nvim", version = "fe7cfe9800a182274d0f868a74b7263b8c0c020b" },
})

require("snacks").setup({
	indent = {
		enabled = true,
		animate = {
			enabled = false,
		},
	},
	input = {
		enabled = true,
	},
	explorer = {
		enabled = true,
		replace_netrw = true,
		trash = true,
	},
	picker = {
		enabled = true,
		ui_select = true,
		prompt = "    ",
		layouts = {
			common = {
				layout = {
					box = "vertical",
					backdrop = false,
					row = -1,
					width = 0,
					height = 0.4,
					border = false,
					title = "",
					title_pos = "left",
					{ win = "input", height = 1, border = "top_bottom" },
					{
						box = "horizontal",
						{ win = "list", border = "hpad" },
						{ win = "preview", title = "{preview}", width = 0.6, border = "left" },
					},
				},
			},
			explorer = {
				layout = {
					position = "float",
					box = "vertical",
					backdrop = false,
					width = 0.4,
					height = 0.7,
					border = true,
					title = "",
					title_pos = "left",
					{ win = "input", height = 1, border = "bottom" },
					{
						box = "horizontal",
						{ win = "list", border = "hpad" },
						{ win = "preview", title = "{preview}", width = 0.6, border = "left" },
					},
				},
			},
		},
		sources = {
			smart = { layout = { preset = "common" }, },
			files = { layout = { preset = "common" }, },
			buffers = { layout = { preset = "common" }, },
			command_history = { layout = { preset = "common", preview = false, }, },
			undo = { layout = { preset = "common" } },
			marks = { layout = { preset = "common" } },
			grep = { layout = { preset = "common" }, regex = false, },
			help = { layout = { preset = "common" }, regex = false, },
			lsp_definitions = { layout = { preset = "common" } },
			lsp_declarations = { layout = { preset = "common" } },
			lsp_references = { layout = { preset = "common" } },
			lsp_implementations = { layout = { preset = "common" } },
			lsp_symbols = { layout = { preset = "common" } },
			lsp_workspace_symbols = { layout = { preset = "common" } },
			explorer = {
				follow_file = true,
				tree = true,
				git_status = true,
				diagnostics = true,
				auto_close = true,
				layout = { preset = "explorer", preview = false },
				win = {
					input = {
						keys = {
							["<Esc>"] = { "cycle_win", mode = { "n", "i" } },
						},
					},
					list = {
						keys = {
							["<M-d>"] = false,
							["<M-f>"] = false,
							["<M-p>"] = false,
							["<M-i>"] = false,
							["<M-h>"] = false,
							["<M-w>"] = false,
							["<M-m>"] = false,
							["<CR>"] = false,
							["<BS>"] = false,
							["<C-W>H"] = false,
							["<C-W>J"] = false,
							["<C-W>K"] = false,
							["<C-W>L"] = false,
							["<C-F>"] = false,
							["<C-B>"] = false,
							["<C-A>"] = false,
							["<C-C>"] = false,
							["<C-P>"] = false,
							["<C-N>"] = false,
							["<C-T>"] = false,
							["<Space>/"] = false,
							["<S-CR>"] = false,
							["."] = false,
							["P"] = false,
							["zz"] = false,
							["zt"] = false,
							["zb"] = false,
							["q"] = false,
							["i"] = false,
							["p"] = false,
							["]g"] = false,
							["[g"] = false,
							["]d"] = false,
							["[d"] = false,
							["]w"] = false,
							["[w"] = false,
							["]e"] = false,
							["[e"] = false,
						},
					},
				},
			},
		},
		win = {
			input = {
				b = {
					minipairs_disable = true,
				},
				keys = {
					-- ["<Esc>"] = { "close", mode = { "n", "i" } },
				},
			},
		},
	},
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#D0D7DE" })
		vim.api.nvim_set_hl(0, "SnacksIndentScope",  { fg = "#7FA2D6", bold = true })
	end
})

nerves.disable_autocomplete("snacks_picker_input")

nerves.set_callable("picker_smart", require("snacks").picker.smart)
nerves.set_callable("picker_files", require("snacks").picker.files)
nerves.set_callable("picker_buffers", require("snacks").picker.buffers)
nerves.set_callable("picker_command_history", require("snacks").picker.command_history)
nerves.set_callable("picker_marks", require("snacks").picker.marks)
nerves.set_callable("picker_undotree", require("snacks").picker.undo)
nerves.set_callable("picker_grep", require("snacks").picker.grep)
nerves.set_callable("picker_lsp_definitions", require("snacks").picker.lsp_definitions)
nerves.set_callable("picker_lsp_declarations", require("snacks").picker.lsp_declarations)
nerves.set_callable("picker_lsp_references", require("snacks").picker.lsp_references)
nerves.set_callable("picker_lsp_implementations", require("snacks").picker.lsp_implementations)
nerves.set_callable("picker_lsp_symbols", require("snacks").picker.lsp_symbols)
nerves.set_callable("picker_lsp_workspace_symbols", require("snacks").picker.lsp_workspace_symbols)
nerves.set_callable("picker_help", require("snacks").picker.help)
nerves.set_callable("file_management_open", require("snacks").explorer)
