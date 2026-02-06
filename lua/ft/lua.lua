local ft = require("api.ft")

ft.setup_treesitter({ "lua" })

ft.setup_lsp('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
					vim.env.VIMRUNTIME,
				},
      },
    })
  end,
  settings = {
    Lua = {
			maxPreload = 2000,
			signatureHelp = { enabled = true },
			codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },
			telemetry = { enable = false },
		},
  },
})

