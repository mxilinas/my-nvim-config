return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
			formatoptions = "",
		},
		view_options = {
			show_hidden = false,
		},
	},
	keys = {
		{ "<leader>e", vim.cmd.Oil, noremap = true, desc = "Open oil" },
	},
}
