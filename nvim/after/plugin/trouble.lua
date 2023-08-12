-- Lua
vim.keymap.set("n", "<leader>et", function() require("trouble").open() end, { desc = "[Trouble] - Opens list" })
vim.keymap.set("n", "<leader><leader>tw", function() require("trouble").open("workspace_diagnostics") end,
	{ desc = "[Trouble] - Toggles workplace diagnostics" })
vim.keymap.set("n", "<leader><leader>td", function() require("trouble").open("document_diagnostics") end,
	{ desc = "[Trouble] - Toggles document diagnostics" })
vim.keymap.set("n", "<leader>eq", function() require("trouble").open("quickfix") end,
	{ desc = "[Trouble] - Quick fix" })
vim.keymap.set("n", "<leader>el", function() require("trouble").open("loclist") end, { desc = "[Trouble] - local list" })
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end,
	{ desc = "[Trouble] - LSP References" })
