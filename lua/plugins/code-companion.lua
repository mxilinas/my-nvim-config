local local_model = "qwen2.5-coder:latest"

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
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
					model = local_model,
				},
			},
			cmd = {
				adapter = {
					name = "ollama",
					model = local_model,
				},
			},
			background = {
				adapter = {
					name = "ollama",
					model = local_model,
				},
			},
			chat = {
				adapter = {
					name = "ollama",
					model = local_model,
				},
			},
			cli = {
				agent = "codex",
				agents = {
					codex = {
						cmd = "codex",
						args = {},
						description = "Codex CLI",
						provider = "terminal",
					},
				},
			},
		},
	},
	keys = {
		{
			"<leader>ca",
			"<cmd>CodeCompanionChat Add<cr>",
			desc = "Add the selection to chat.",
			mode = { "n", "v" },
		},
		{
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "Toggle CodeCompanionChat",
		},
		{ "<leader>ci", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "Inline code edit" },
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)

        -- Notifications
		local notify = require("notify")
		local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "*",
			group = group,
			callback = function(payload)
				if payload.match == "CodeCompanionRequestStarted" then
					notify(
						payload.match
							.. "\n"
							.. "\t\t"
							.. payload.data.adapter.model
							.. "@"
							.. payload.data.adapter.name,
						"info"
					)
				end
			end,
		})
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "*",
			group = group,
			callback = function(payload)
				if payload.match == "CodeCompanionRequestFinished" then
					notify(payload.match, "info")
				end
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "codecompanion",
			callback = function()
				vim.api.nvim_buf_set_keymap(
					0,
					"n",
					"<leader>ca",
					"<cmd>CodeCompanionActions<cr>",
					{ noremap = true, silent = true }
				)
			end,
		})
	end,
}
