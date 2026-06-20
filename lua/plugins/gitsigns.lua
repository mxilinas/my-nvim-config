return {
	"lewis6991/gitsigns.nvim",
	config = function(_, opts)
		require("gitsigns").setup(opts)

		local gitsigns = require("gitsigns")

		vim.keymap.set("n", "]h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]h", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "next hunk" })

		vim.keymap.set("n", "[h", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "prev hunk" })

		-- Actions
		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })

		vim.keymap.set("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage selected hunk" })

		vim.keymap.set("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset selected hunk" })

		vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
		vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
		vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

		vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff buffer" })

		vim.keymap.set("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, { desc = "Diff buffer against HEAD" })

		vim.keymap.set("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end, { desc = "List all hunks in quickfix" })
		vim.keymap.set("n", "<leader>hq", gitsigns.setqflist, { desc = "List hunks in quickfix" })

		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
		vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

		vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
	end,
}
