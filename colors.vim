set background=dark
let g:colors_name="darcula"

lua package.loaded['theme'] = nil
lua require('lush')(require('theme'))
