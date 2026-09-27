return {
	"sindrets/diffview.nvim",
	opts = {
		use_icons = false,
		file_panel = {
			listing_style = "list", -- One of 'list' or 'tree'
			win_config = {
				position = "left",
				width = 55,
			},
		},
		view = {
			default = {
				layout = "diff2_vertical",
			},
		},
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
