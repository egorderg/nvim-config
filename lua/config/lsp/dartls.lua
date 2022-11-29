local setup = function (on_attach, capabilities)
	require('lspconfig').dartls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
		init_options = {
			closingLabels = true,
		},
	}
end

return setup
