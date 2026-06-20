return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			http = {
				opts = {
					show_defaults = false,
					show_model_choices = true,
					show_presets = false,
				},
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							num_ctx = {
								default = 8192,
							},
						},
					})
				end,
			},
			acp = {
				opts = {
					show_defaults = false,
					show_model_choices = true,
					show_presets = false,
				},
				-- Must have codex acp binary on path for this to work.
				codex = function()
					return require("codecompanion.adapters").extend("codex", {
						defaults = {
							auth_method = "chatgpt",
						},
					})
				end,
			},
		},
		display = {
			chat = {
				show_settings = false, -- Must be false to change adapter and model in the chat buffer.
			},
		},
		opts = {
			log_level = "DEBUG",
		},
		interactions = {
			inline = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:latest",
				},
			},
			cmd = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:latest",
				},
			},
			background = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:latest",
				},
			},
			chat = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:latest",
				},
			},
		},
	},
	keys = {
		{
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "Toggle CodeCompanionChat",
		},
		{ "<leader>ci", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Inline code edit" },
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)
	end,
}
