local function set_files(files)
	local devicons = require('nvim-web-devicons')
	local icons = devicons.get_icons()

	for ft, target_ft in pairs(files) do
		vim.cmd('autocmd BufEnter *.' .. ft .. ' :set filetype=' .. target_ft)

		devicons.set_icon({
			[ft] = icons[target_ft]
		})
	end
end

local settings_name = '.vimrc.json'
local settings_path = vim.fs.normalize(vim.fn.getcwd() .. '/' .. settings_name)

local exists = vim.fn.filereadable(settings_path)

if exists > 0 then
	local content = vim.fn.readfile(settings_path)
	local settings = vim.fn.json_decode(content)

	if settings.files ~= nil then
		set_files(settings.files)
	end
end
