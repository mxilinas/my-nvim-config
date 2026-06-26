return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		contrast = "soft",
		dim_inactive = true,
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		-- vim.keymap.set("n", "<leader>t", function()
		-- 	if vim.o.background == "dark" then
		-- 		vim.o.background = "light"
		-- 	else
		-- 		vim.o.background = "dark"
		-- 	end
		-- end)
		vim.o.background = "dark"
		vim.cmd.colorscheme("gruvbox")
	end,
}
