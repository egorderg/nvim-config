local nerves = require("nerves")

require("api.pack").add({
	{	src = "https://github.com/folke/flash.nvim", version = "fcea7ff883235d9024dc41e638f164a450c14ca2" }
})

require("flash").setup({
	modes = {
		char = {
			enabled = false
		}
	}
})

nerves.set_callable("jump", require("flash").jump)
