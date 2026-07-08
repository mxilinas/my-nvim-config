return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>ma", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "<leader>mm", "<cmd>Telescope grapple tags<cr>", desc = "Grapple open tags window" },
		{ "<leader>mn", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "<leader>mp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
		{ "<leader>mr", "<cmd>Grapple reset<cr>", desc = "Grapple reset" },
	},
	config = function(_, opts)
		require("grapple").setup(opts)
		require("telescope").load_extension("grapple")
		require("lualine").setup({
			sections = {
				lualine_b = { "grapple" },
			},
		})
	end,
}
