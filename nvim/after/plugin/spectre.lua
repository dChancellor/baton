vim.keymap.set('n', '<leader><leader>So', '<cmd>lua require("spectre").toggle()<CR>', {
	desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader><leader>Sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
	desc = "Search current word"
})
vim.keymap.set('v', '<leader><leader>Sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
	desc = "Search current word"
})
vim.keymap.set('n', '<leader><leader>Sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
	desc = "Search on current file"
})
