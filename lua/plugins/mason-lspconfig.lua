return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{
			"mason-org/mason.nvim",
			opts = {
				firewall = {
					enabled = true,
				},
				ui = {
					keymaps = {
						uninstall_package = "x",
					},
				},
			},
			config = true,
		},
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
		})
	end,
}
