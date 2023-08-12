-- Run an individual test
vim.keymap.set("n", "<leader>tr", '<cmd>:lua require"jester".run()<CR>')
-- Run last test
vim.keymap.set("n", "<leader>tlr", '<cmd>:lua require"jester".run_last()<CR>')
-- Run entire test file
vim.keymap.set("n", "<leader>trf", '<cmd>:lua require"jester".run_file()<CR>')
