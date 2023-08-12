local wk = require('which-key')

wk.register({
	c = {
		name = "Code and Comment"
	},
	d = {
		name = "LSP Document Symbol",
	},
	v = {
		name = "View"
	},
	e = {
		name = "Error and Diagnostic"
	},
	g = {
		name = "Git"
	},
	h = {
		name = "Harpoon"
	},
	r = {
		name = "Rename",
	},
	s = {
		name = "Search"
	},
	t = {
		name = "Test"
	},
	w = {
		name = "Workspace stuff"
	}
}, { prefix = "<leader>" })
