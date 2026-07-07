return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "warm", -- dark, darker, cool, deep, warm, warmer, light
			toggle_style_key = "<leader>s",
			toggle_style_list = { "warm", "light" },
		})
		require("onedark").load()
	end,
}
