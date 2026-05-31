return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {
		dir = vim.fn.stdpath("state") .. "/sessions/",
	},
	keys = {
		{
			"<leader>qs",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Load last session",
		},
	},
}
