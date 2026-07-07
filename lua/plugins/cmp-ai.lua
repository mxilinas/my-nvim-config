return {
	"tzachar/cmp-ai",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local cmp_ai = require("cmp_ai.config")
        local notify = require("notify")
		cmp_ai:setup({
			max_lines = 100,
			provider = "Ollama",
			provider_options = {
				auto_unload = false,
				model = "qwen2.5-coder:3b-base-q6_K",
				prompt = function(lines_before, lines_after)
					return "<|fim_prefix|>" .. lines_before .. "<|fim_suffix|>" .. lines_after .. "<|fim_middle|>"
				end,
			},
			run_on_every_keystroke = true,
			notify = true,
            notify_callback = function (msg)
                notify(msg, "info")
            end
		})
	end,
}
