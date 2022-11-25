require('lspsaga').init_lsp_saga({
	code_action_lightbulb = {
		enable = false,
	},
	finder_action_keys = {
		open = {'o', '<CR>'},
		vsplit = '<leader>sh',
		split = '<leader>sv',
		quit = {'q', '<ESC>'},
	},
	code_action_keys = {
		quit = 'q',
		exec = '<CR>',
	},
	definition_action_keys = {
		edit = '<leader>o',
		vsplit = '<leader>sh',
		split = '<leader>sv',
		quit = 'q',
	},
})

vim.keymap.set('n', 'gr', '<cmd>Lspsaga lsp_finder<cr>', { silent = true })
vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', { silent = true })
vim.keymap.set('n', 'ga', '<cmd>Lspsaga code_action<cr>', { silent = true })
vim.keymap.set('n', 'gn', '<cmd>Lspsaga rename<cr>', { silent = true })
vim.keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>', { silent = true })
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true })

require('lspkind').init {
	mode = "symbol",
	preset = "default",
  symbol_map = {
    NONE = "",
    Array = "",
    Boolean = "⊨",
    Class = "",
    Constructor = "",
    Key = "",
    Namespace = "",
    Null = "NULL",
    Number = "#",
    Object = "⦿",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "𝓐",
    TypeParameter = "",
    Unit = "",
  },
}
