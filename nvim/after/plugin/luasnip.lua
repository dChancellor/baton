local ls = require('luasnip')

require('luasnip.loaders.from_lua').lazy_load({ paths = "~/.config/nvim/snippets" })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("n", "<leader><leader>z", function()
	require('luasnip.loaders.from_lua').load({ paths = "~/.config/nvim/snippets" })
end, { silent = true, desc = "Quick reloads the snippet files" }
)
