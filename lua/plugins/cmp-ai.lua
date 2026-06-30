return {
	"tzachar/cmp-ai",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local cmp_ai = require("cmp_ai.config")
		cmp_ai:setup({
			max_lines = 10,
			provider = "Ollama",
			provider_options = {
				auto_unload = false,
				model = "qwen2.5-coder:1.5b-base",
				prompt = function(lines_before, lines_after)
					return "<|fim_prefix|>" .. lines_before .. "<|fim_suffix|>" .. lines_after .. "<|fim_middle|>"
				end,
			},
			notify = true,
			notify_callback = function(msg)
				vim.notify(msg)
			end,
			run_on_every_keystroke = true,
		})
	end,
}
