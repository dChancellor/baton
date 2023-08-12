vim.cmd "let g:undotree_WindowLayout = 2"

vim.keymap.set('n', '<leader><leader>u', vim.cmd.UndotreeToggle, { desc = "Opens UndoTree" })
