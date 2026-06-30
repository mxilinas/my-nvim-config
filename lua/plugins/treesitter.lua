return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldexpr = "v:lua.require'nvim-treesitter'.foldexpr()"
			end,
		})

		local ensure_installed = {
			"lua",
			"tsx",
			"typescript",
			"javascript",
			"python",
			"cpp",
			"css",
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
