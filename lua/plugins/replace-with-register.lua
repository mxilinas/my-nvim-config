return {
	"inkarkat/vim-ReplaceWithRegister",
	config = function()
		vim.keymap.del("n", "gra")
		vim.keymap.del("n", "gri")
	end,
}
