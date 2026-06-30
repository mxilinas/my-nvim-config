return {
	"danymat/neogen",
	config = true,
	version = "*",
	opts = {
		snippet_engine = "luasnip",
	},
	keys = {
		{
			"<leader>k",
			function()
				require("neogen").generate()
			end,
			noremap = true,
			desc = "Generate docstring.",
		},
	},
}
