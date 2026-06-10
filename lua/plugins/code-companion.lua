return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		opts = {
			log_level = "DEBUG",
		},
		interactions = {
			chat = {
				adapter = "openai",
			},
			inline = {
				adapter = "openai",
			},
			cmd = {
				adapter = "openai",
			},
			background = {
				adapter = "openai",
			},
		},
	},
	keys = {
		{
			"<leader>cc",
			function()
				require("codecompanion").chat()
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)
	end,
}
