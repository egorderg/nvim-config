local buffer_close = function(bufnum)
	require('bufdelete').bufdelete(bufnum, true)
end

require('bufferline').setup {
	options = {
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 },
      { filetype = "Outline", text = "", padding = 1 },
    },
		close_command = buffer_close,
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    separator_style = "thin",
  },
}
