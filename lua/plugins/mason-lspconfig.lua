return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{
			"mason-org/mason.nvim",
			config = true,
			opts = {
				firewall = {
					enabled = true,
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
	config = true,
}
