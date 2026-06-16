return {
	"folke/lazydev.nvim",
	ft = "lua",
	lazy = false,
	opts = {
        lspconfig = true,
        cmp = true,
        enabled = true,
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
