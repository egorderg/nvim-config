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
vim.keymap.set("n", "<leader>ft", '<cmd>Telescope file_browser<cr>', {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fR", builtin.registers, {})
vim.keymap.set("n", "<leader>fc", builtin.commands, {})
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fr", builtin.resume, {})
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

-- Split
vim.keymap.set('n', '<leader>sh', '<cmd>vsplit<cr>', {})
vim.keymap.set('n', '<leader>sv', '<cmd>split<cr>', {})

-- Explore
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", {})

-- Buffers
vim.keymap.set("n", "<leader>cc", "<cmd>bdelete<cr>", {})
vim.keymap.set("n", "<leader>ca", "<cmd>%bd|e#|bd#<cr>", {})

-- Terminal
local function open_term()
	if vim.fn.executable('zsh') == 1 then
		vim.cmd('e term://zsh')
	else
		vim.cmd('e term://bash')
	end
end

vim.keymap.set("n", "<leader>tt", open_term, {})
vim.keymap.set('n', '<leader>tf', '<cmd>e term://ranger<cr>', {})
vim.keymap.set('n', '<leader>tg', '<cmd>e term://lazygit<cr>', {})
vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], {})

