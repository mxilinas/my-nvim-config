return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	init = function()
		vim.api.nvim_create_autocmd("Filetype", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
		local ensure_installed = {
			"lua",
			"javascript",
			"css",
			"cpp",
		}
		local already_installed = require("nvim-treesitter.config").get_installed()
		local parser_to_install = vim.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(already_installed, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parser_to_install)
	end,
}
