return {
	"sindrets/diffview.nvim",
	opts = {
		use_icons = false,
	},
	keys = {
		{
			"<leader>d",
			function()
				vim.cmd("DiffviewOpen")
			end,
			desc = "Diff view open",
		},
		{
			"<leader>D",
			function()
				vim.ui.input({ prompt = "Compare against branch: ", default = "origin/main" }, function(input)
					if not input then
						return
					end
					vim.cmd("DiffviewOpen " .. input .. "...HEAD")
				end)
			end,
			desc = "Diff against branch",
		},
	},
}
