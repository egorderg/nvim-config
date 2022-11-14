-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local mason_lsp = require("mason-lspconfig")
local mason_ls = require("mason-null-ls")

local lsp = require("lspconfig")
local null_ls = require("null-ls")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {
	"markdown",
	"plaintext"
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", {})

local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- Declaration/Definition
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)

	vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, bufopts)

	-- Code Actions
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, bufopts)

	-- Hover
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

	-- Format
	vim.keymap.set("n", "<space>lf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	-- Highlight
	local highlight_name = vim.fn.printf("lsp_document_highlight_%d", bufnr)

	vim.api.nvim_create_augroup(highlight_name, {})
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		group = highlight_name,
		buffer = bufnr,
		callback = function() vim.lsp.buf.document_highlight() end,
	})
	vim.api.nvim_create_autocmd("CursorMoved", {
		group = highlight_name,
		buffer = bufnr,
		callback = function() vim.lsp.buf.clear_references() end,
	})
end

-- Setup LSP Servers
mason_lsp.setup_handlers({
	function(server)
		local ok, server_config_ext = pcall(require, "config.lsp." .. server)
		local server_config = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		if ok then
			for k, v in pairs(server_config_ext) do
				server_config[k] = v
			end
		end

		lsp[server].setup(server_config)
	end,
})

-- Register Mason Handlers to Null-LS
mason_ls.setup_handlers({
	function(source, source_types)
		vim.tbl_map(function(type)
			null_ls.register(null_ls.builtins[type][source])
		end, source_types)
	end,
})

-- Setup Null-LS
null_ls.setup({
	on_attach = on_attach,
})
