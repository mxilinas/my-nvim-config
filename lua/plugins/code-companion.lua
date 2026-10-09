local fast_model = "qwen2.5-coder:latest"
local agent_model = "qwen3.5:9b"

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
							keep_alive = {
								default = "30m",
							},
							num_ctx = {
								default = 65536,
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
			log_level = "WARN",
		},
		interactions = {
			inline = {
				adapter = {
					name = "ollama",
					model = fast_model,
				},
			},
			cmd = {
				adapter = {
					name = "ollama",
					model = fast_model,
				},
			},
			background = {
				adapter = {
					name = "ollama",
					model = fast_model,
				},
			},
			chat = {
				adapter = {
					name = "ollama",
					model = agent_model,
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
	config = function(_, opts)
		require("codecompanion").setup(opts)

		-- Keybinds
		vim.api.nvim_set_keymap(
			"v",
			"<leader>ca",
			"<cmd>CodeCompanionChat Add<cr>",
			{ desc = "Add the selection to chat." }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			{ desc = "Toggle CodeCompanionChat" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>cC",
			"<cmd>CodeCompanionChat Toggle adapter=codex<cr>",
			{ desc = "Toggle Codex CodeCompanionChat" }
		)

		vim.api.nvim_set_keymap(
			"v",
			"<leader>ci",
			"<cmd>CodeCompanion<cr>",
			{ desc = "Inline code edit"}
		)

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

		-- Notifications
		local notify = require("notify")

		local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "CodeCompanion*",
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
				elseif payload.match == "CodeCompanionRequestFinished" then
					notify(payload.match, "info")
				end
			end,
		})
	end,
}
