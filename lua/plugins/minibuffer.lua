require("api.pack").add({
	{	src = "https://github.com/simifalaye/minibuffer.nvim", version = "0609649d6cbe6194123bed7681807e764e391969" }
})

require('vim._extui').enable({
 enable = true,
 msg = {
   target = 'cmd',
   timeout = 4000,
 },
})

vim.ui.select = require("minibuffer.builtin.ui_select")
vim.ui.input = require("minibuffer.builtin.ui_input")
