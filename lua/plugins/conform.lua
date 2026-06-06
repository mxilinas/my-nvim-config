return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		},
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({lsp_format = "fallback"})
			end,
			mode = { "n", "v", },
			desc = "conform format",
		},
	},
}
