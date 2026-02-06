if vim.g.neovide then
	vim.opt.guifont = "JetBrainsMono Nerd Font:h10.7"
	vim.opt.linespace = 2

	-- Text
	vim.g.neovide_text_gamma = 0.0
	vim.g.neovide_text_contrast = 1.0

	-- Shadow
	vim.g.neovide_floating_shadow = false
	vim.g.neovide_floating_z_height = 5
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 2

	-- Animation
	vim.g.neovide_scroll_animation_length = 0.1
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0

	-- Padding
	vim.g.neovide_padding_top = 32
	vim.g.neovide_padding_bottom = 32
	vim.g.neovide_padding_right = 32
	vim.g.neovide_padding_left = 32

	vim.g.neovide_theme = "auto"
	vim.g.neovide_refresh_rate = 144
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_hide_mouse_when_typing = true
end

