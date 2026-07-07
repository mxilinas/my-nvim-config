return {
	"danymat/neogen",
	opts = {
		snippet_engine = "luasnip",
	},
	config = function(_, opts)
		local neogen = require("neogen")
		neogen.setup(opts)
		vim.keymap.set("n", "<leader>k", function()
			neogen.generate()
		end, { noremap = true })
	end,
}
