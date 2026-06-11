return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black", lsp_format = "fallback" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			cpp = { "clangd-format", lsp_format = "fallback" },
		},
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" }, function(err, did_edit)
					if err then
						print("Failed to format!", err)
					end
					if did_edit then
						print("Formatted")
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "Conform format",
		},
	},
}
