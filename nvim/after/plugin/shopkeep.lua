local custom_material = require('lualine.themes.material')

custom_material.normal.c.bg = '#14111c'
custom_material.normal.c.fg = '#7c7294'

custom_material.normal.b.bg = '#29233b'
custom_material.normal.b.fg = '#7c7294'

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = custom_material
	},
}

vim.cmd [[colorscheme shopkeep]]

