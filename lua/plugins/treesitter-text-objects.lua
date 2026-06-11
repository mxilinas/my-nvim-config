return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	config = function()
		require("nvim-treesitter-textobjects").setup({})

		vim.keymap.set({ "x", "o" }, "af", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end, {desc = "Select outer function"})

		vim.keymap.set({ "x", "o" }, "if", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end, {desc = "Select inner function"})

		vim.keymap.set({ "x", "o" }, "ac", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end, {desc = "Select outer class"})

		vim.keymap.set({ "x", "o" }, "ic", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end, {desc = "Select inner class"})

		vim.keymap.set({ "x", "o" }, "is", function()
			require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
		end, {desc = "Select local scope"})

		vim.keymap.set("n", "<leader>a", function()
			require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
		end, {desc = "Swap to next parameter"})

		vim.keymap.set("n", "<leader>A", function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
		end, {desc = "Swap to previous parameter"})

	end,
}
