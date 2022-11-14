local db = require('dashboard')

db.custom_center = {
	{
		icon = '  ',
		desc = 'Recently latest session                 ',
		shortcut = 'LEADER sl',
		action ='SessionLoad'
	},
	{
		icon = '  ',
		desc = 'Recently opened files                   ',
		action =  'Telescope oldfiles',
		shortcut = 'LEADER fo'
	},
	{
		icon = '  ',
		desc = 'Find  File                              ',
		action = 'Telescope find_files find_command=rg,--hidden,--files',
		shortcut = 'LEADER ff'
	},
	{
		icon = '  ',
		desc = 'Find  word                              ',
		action = 'Telescope live_grep',
		shortcut = 'LEADER fg'
	},
}

db.default_banner = {
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
'',
'',
'',
}

