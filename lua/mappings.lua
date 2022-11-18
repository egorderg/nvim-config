local api = vim.api
local g = vim.g

-- Leader Key
api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "

-- Standard
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", {})
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", {})
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", {})
vim.keymap.set("n", "<leader>ch", "<cmd>checkhealth<cr>", {})
vim.keymap.set("n", "<leader>h", "<cmd>noh<cr>", {})

-- Packer
vim.keymap.set("n", "<leader>pi", "<cmd>PackerInstall<cr>", {})
vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>", {})
vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<cr>", {})

-- Mason
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", {})
vim.keymap.set("n", "<leader>mi", "<cmd>Mason<cr>", {})

-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fF", function ()
	builtin.find_files { hidden = true, no_ignore = true }
end, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fR", builtin.registers, {})
vim.keymap.set("n", "<leader>fc", builtin.commands, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, {})
vim.keymap.set("n", "<leader>fs", function()
		local aerial_avail, _ = pcall(require, "aerial")
		if aerial_avail then
			require("telescope").extensions.aerial.aerial()
		else
			require("telescope.builtin").lsp_document_symbols()
		end
	end,
	{}
)

-- Neotree
vim.keymap.set("n", "<F8>", "<cmd>NvimTreeToggle<cr>", {})
vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeFocus<cr>", {})

-- Aerial
vim.keymap.set("n", "<F9>", "<cmd>AerialToggle<cr>", {})

-- Buffers
vim.keymap.set("n", "<leader>cc", "<cmd>Bdelete<cr>", {})
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", {})
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", {})

-- Terminal
local open_term = function (size, direction)
	return function ()
		local term_id = 1
		if vim.v.count > 0 then
			term_id = vim.v.count
		end
		return "<cmd>" .. term_id .. "ToggleTerm size=" .. size .. " direction=" .. direction .."<cr>"
	end
end

vim.keymap.set("n", "<leader>tf", open_term(10, 'float'), { expr = true })
vim.keymap.set("n", "<leader>th", open_term(10, 'horizontal'), { expr = true })

vim.keymap.set("t", "<c-esc>", [[<C-\><C-n>]], {})
