local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[HARPOON] - Add file to Harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "[HARPOON] - Toggles Harpoon quick menu" })
vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "[HARPOON] - Goes to 1st buffer" })
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end,
	{ desc = "[HARPOON] - Goes to 2nd buffer" })
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "[HARPOON] - Goes to 3rd buffer" })
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end,
	{ desc = "[HARPOON] - Goes to 4th buffer" })
