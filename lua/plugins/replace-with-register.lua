return {
	"inkarkat/vim-ReplaceWithRegister",
	config = function()
		vim.keymap.del("n", "gra")
		vim.keymap.del("n", "gri")
		vim.api.nvim_set_keymap("n", "<Leader>r", "<Plug>ReplaceWithRegisterOperator", {
			desc = "Replace with register.",
		})
		vim.api.nvim_set_keymap("n", "<Leader>rr", "<Plug>ReplaceWithRegisterLine", {
			desc = "Replace with register.",
		})
		vim.api.nvim_set_keymap("x", "<Leader>r", "<Plug>ReplaceWithRegisterVisual", {
			desc = "Replace with register.",
		})
	end,
}
