return {
	"nvim-lualine/lualine.nvim",
	config = function()
		vim.o.laststatus = 0
		require("lualine").setup({
			options = {
				icons_enabled = false,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				always_show_tabline = true,
			},
			sections = {},
			inactive_sections = {},
			tabline = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"searchcount",
					"filename",
					{
						function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						end,
					},
				},
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_tabline = {
				lualine_c = { "filename" },
				lualine_x = { "location" },
			},
		})
	end,
}
