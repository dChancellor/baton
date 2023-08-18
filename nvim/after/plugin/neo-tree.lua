require('neo-tree').setup({
	close_if_last_window = true,
	window = {
		width = 20
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			never_show = {
				'.git'
			}
		}
	},
	follow_current_file = {
		enabled = true,
		leave_dirs_open = true
	},
})

vim.keymap.set('n', '<leader>vn', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neotree' })
vim.keymap.set('n', '<leader>vf', '<cmd>Neotree reveal<CR>', { desc = 'Show buffer in Neotree' })
