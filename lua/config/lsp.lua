-- https://github.com/neovim/nvim-lspconfig

local keymap = require("api.keymap")

vim.diagnostic.config({
  signs = false,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end

		if client:supports_method("textDocument/inlayHints") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method('textDocument/willSaveWaitUntil')
				and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
				buffer = args.buf,
				callback = function()
					-- vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end

		keymap.set_local_nerve({ "n" }, "gd", "picker_lsp_definitions", { desc = "Definitions" })
		keymap.set_local_nerve({ "n" }, "gD", "picker_lsp_declarations", { desc = "Declarations" })
		keymap.set_local_nerve({ "n" }, "gr", "picker_lsp_references", { desc = "References" })
		keymap.set_local_nerve({ "n" }, "gR", "picker_lsp_implementations", { desc = "Implementations" })
		keymap.set_local_nerve({ "n" }, "gs", "picker_lsp_symbols", { desc = "Symbols" })
		keymap.set_local_nerve({ "n" }, "gS", "picker_lsp_workspace_symbols", { desc = "Workspace symbols" })

		keymap.set_local({ "n" }, "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "Code actions" })
		keymap.set_local({ "n" }, "<leader>ln", vim.lsp.buf.rename, { desc = "Rename" })
		keymap.set_local({ "n" }, "<leader>li", "<cmd>checkhealth vim.lsp<cr>", { desc = "Info" })
	end,
})
