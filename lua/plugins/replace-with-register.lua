local function rm_map(lhs, modes, buf)
	if type(modes) == "string" then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		pcall(vim.keymap.del, mode, lhs, { buffer = buf })
	end
end

return {
	"inkarkat/vim-ReplaceWithRegister",
	config = function()
		rm_map("gri", "n")
		rm_map("gra", { "n", "v" })
		rm_map("grr", "n")

		vim.api.nvim_set_keymap("n", "gr", "<Plug>ReplaceWithRegisterOperator", {
			noremap = true,
			silent = true,
			desc = "Replace with register operator",
		})

		vim.api.nvim_set_keymap("n", "grr", "<Plug>ReplaceWithRegisterLine", {
			noremap = true,
			silent = true,
			desc = "Replace with register line",
		})

		vim.api.nvim_set_keymap("x", "gr", "<Plug>ReplaceWithRegisterVisual", {
			noremap = true,
			silent = true,
			desc = "Replace with register visual",
		})
	end,
}
