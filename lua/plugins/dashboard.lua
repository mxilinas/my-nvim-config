return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			config = {
				icon = "",
				theme = "doom",
				desc = "",
				footer = {},
				header = {},
				vertical_center = true,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
