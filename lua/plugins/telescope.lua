return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-a>"] = function(prompt_bufnr)
						require("telescope.actions").toggle_selection(prompt_bufnr)
					end,
					["<C-q>"] = function(prompt_bufnr)
						require("telescope.actions").smart_send_to_qflist(prompt_bufnr)
					end,
				},
			},
			results_title = false,
			prompt_title = false,
			path_display = {
				shorten = 3,
			},
			dynamic_preview_title = true,
			scroll_strategy = "limit",
			layout_strategy = "flex",
			layout_config = {
				height = 0.99,
				width = 0.99,
				prompt_position = "bottom",
				horizontal = {
					preview_width = 80,
				},
			},
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
			{
				"<leader>fy",
				function()
					builtin.colorscheme({ ignore_builtins = true })
				end,
				desc = "Telescope find colorschemes",
			},
			{ "<leader>fg", builtin.live_grep, desc = "Telescope live grep" },
			{ "<leader>fG", builtin.current_buffer_fuzzy_find, desc = "Telescope live grep buffer" },
			{ "<leader>fp", builtin.builtin, desc = "Telescope pickers" },
			{ "<leader>fc", builtin.commands, desc = "Telescope commands" },
			{ "<leader>fb", builtin.buffers, desc = "Telescope buffers" },
			{ "<leader>fh", builtin.help_tags, desc = "Telescope help tags" },
			{ "<leader>fj", builtin.jumplist, desc = "Telescope jumps" },
			{ "<leader>fe", builtin.registers, desc = "Telescope registers" },
			{ "<leader>fm", builtin.marks, desc = "Telescope marks" },
			{ "<leader>fq", builtin.quickfix, desc = "Telescope quickfix" },
			{ "<leader>fr", builtin.lsp_references, desc = "Telescope references" },
			{ "<leader>fk", builtin.keymaps, desc = "Telescope keymaps" },
			{ "<leader>fi", builtin.lsp_incoming_calls, desc = "Telescope incoming" },
			{ "<leader>fo", builtin.lsp_outgoing_calls, desc = "Telescope outgoing" },
			{ "<leader>fs", builtin.lsp_document_symbols, desc = "Telescope symbols" },
			{ "<leader>fd", builtin.diagnostics, desc = "Telescope diagnostics" },
		}
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")
	end,
}
