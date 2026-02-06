local nerves = require("nerves")
local buffer = require("api.buffer")

require("api.pack").add({
	{	src = "https://github.com/nvim-mini/mini.nvim", version = "a995fe9cd4193fb492b5df69175a351a74b3d36b" }
})

require("mini.icons").setup()
require("mini.icons").tweak_lsp_kind()
require("mini.icons").mock_nvim_web_devicons()

require("mini.git").setup()

require("mini.pairs").setup({
	modes = { insert = true, command = true, terminal = false },
	skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
	skip_ts = { "string" },
	skip_unbalanced = true,
	markdown = true,
})

require("mini.statusline").setup({
	use_icons = true,
	content = {
		active = function()
			local cur_ft = buffer.get_current().filetype
			local statusline = require("mini.statusline")
			local statusline_nerve = nerves.get_statusline(cur_ft)

			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local git           = statusline.section_git({ trunc_width = 40 })
			-- local diff          = statusline.section_diff({ trunc_width = 75 })
			local diagnostics   = statusline.section_diagnostics({ trunc_width = 75, icon = "", signs = { ERROR = " ", WARN = " ", INFO = " ", HINT = " " } })
			local lsp           = statusline.section_lsp({ trunc_width = 75, icon = "󱘖" })
			local filename      = statusline.section_filename({ trunc_width = 140 })
			local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
			local location      = statusline.section_location({ trunc_width = 75 })
			local search        = statusline.section_searchcount({ trunc_width = 75 })

			if statusline_nerve ~= nil then
				return statusline.combine_groups({
					{ hl = mode_hl, strings = { statusline_nerve.active() } }
				})
			end

			return statusline.combine_groups({
				{ hl = mode_hl,                  strings = { mode } },
				{ hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics, lsp } },
				'%<', -- Mark general truncate point
				{ hl = 'MiniStatuslineFilename', strings = { filename } },
				'%=', -- End left alignment
				{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
				{ hl = mode_hl,                  strings = { search, location } },
			})
		end,
		inactive = function()
			local cur_ft = buffer.get_current().filetype
			local statusline = require("mini.statusline")
			local statusline_nerve = nerves.get_statusline(cur_ft)

			if statusline_nerve ~= nil then
				return statusline.combine_groups({
					{ hl = "Normal", strings = { statusline_nerve.inactive() } }
				})
			end

			local filename = statusline.section_filename({ trunc_width = 140 })

			return statusline.combine_groups({
				{ hl = 'MiniStatuslineFilename', strings = { filename } },
			})
		end
	},
})

require("mini.completion").setup({
	delay = { completion = 100, info = 10^7, signature = 50 },
	lsp_completion = {
		source_func = "completefunc",
		auto_setup = true,
	},
  fallback_action = function()
    local has_lsp = #vim.lsp.get_clients({ bufnr = 0 }) > 0
    if has_lsp then
      return
    end

    vim.api.nvim_feedkeys(vim.keycode("<C-n>"), "n", false)
  end,
	mappings = {
    force_twostep = '<C-Space>',
    force_fallback = '',
  },
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		vim.b.minicompletion_disable = nerves.is_autocomplete_disabled(vim.bo[args.buf].filetype)
	end
})

