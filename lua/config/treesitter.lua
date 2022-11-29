require('nvim-treesitter.configs').setup {
	ensure_installed = { 'lua' },
	sync_install = true,
	highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,

		disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
  autopairs = { enable = true },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
}
