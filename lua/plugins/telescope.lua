return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			layout_strategy = "horizontal",
		},
		preview = {
			treesitter = false, -- Fixes stupid error.
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<leader>ff", builtin.find_files, desc = "Telescope find files" },
			{ "<leader>fg", builtin.live_grep, desc = "Telescope live grep" },
			{ "<leader>fG", builtin.current_buffer_fuzzy_find, desc = "Telescope live grep buffer" },
			{ "<leader>fc", builtin.commands, desc = "Telescope commands" },
			{ "<leader>fb", builtin.buffers, desc = "Telescope buffers" },
			{ "<leader>fh", builtin.help_tags, desc = "Telescope help tags" },
			{ "<leader>fj", builtin.jumplist, desc = "Telescope jumps" },
			{ "<leader>fe", builtin.registers, desc = "Telescope registers" },
			{ "<leader>fm", builtin.marks, desc = "Telescope marks" },
			{ "<leader>fq", builtin.quickfix, desc = "Telescope quickfix" },
			{ "<leader>fr", builtin.lsp_references, desc = "Telescope quickfix" },
			{ "<leader>fi", builtin.lsp_incoming_calls, desc = "Telescope incoming" },
			{ "<leader>fo", builtin.lsp_outgoing_calls, desc = "Telescope outgoing" },
			{ "<leader>fs", builtin.lsp_document_symbols, desc = "Telescope symbols" },
			{ "<leader>fd", builtin.diagnostics, desc = "Telescope diagnostics" },
			{ "<leader>ft", builtin.treesitter, desc = "Telescope treesitter" },
		}
	end,
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
