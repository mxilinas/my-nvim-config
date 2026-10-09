return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, { desc = "next hunk", buffer = bufnr })

			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "prev hunk", buffer = bufnr })

			-- Actions

			vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk", buffer = bufnr })
			vim.keymap.set("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage selected hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk", buffer = bufnr })
			vim.keymap.set("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset selected hunk", buffer = bufnr })

			vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer", buffer = bufnr })
			vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer", buffer = bufnr })
			vim.keymap.set(
				"n",
				"<leader>gp",
				gitsigns.preview_hunk_inline,
				{ desc = "Preview hunk inline", buffer = bufnr }
			)

			vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff buffer", buffer = bufnr })

			vim.keymap.set("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end, { desc = "Diff buffer against HEAD", buffer = bufnr })

			vim.keymap.set("n", "<leader>hQ", function()
				gitsigns.setqflist("all")
			end, { desc = "List all hunks in quickfix" })
			vim.keymap.set("n", "<leader>hq", gitsigns.setqflist, { desc = "List hunks in quickfix", buffer = bufnr })

			vim.keymap.set(
				"n",
				"<leader>tb",
				gitsigns.toggle_current_line_blame,
				{ desc = "Toggle line blame", buffer = bufnr }
			)

			vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff", buffer = bufnr })

			vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk", buffer = bufnr })
		end,
	},
}
