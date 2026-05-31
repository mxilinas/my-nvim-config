return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	run = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip.loaders.from_vscode").load()
	end,
}
