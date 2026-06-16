vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				-- autoSearchPaths = true,
				extraPaths = {
					vim.fn.getcwd() .. "/src",
				},
			},
		},
	},
})
