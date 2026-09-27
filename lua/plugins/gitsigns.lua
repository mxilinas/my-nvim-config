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
			end, { desc = "next hunk", buf = bufnr })

			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, { desc = "prev hunk", buf = bufnr })

			-- Actions

			vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk", buf = bufnr })
			vim.keymap.set("v", "<leader>gs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Stage selected hunk", buf = bufnr })

			vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk", buf = bufnr })
			vim.keymap.set("v", "<leader>gr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Reset selected hunk", buf = bufnr })

			vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer", buf = bufnr })
			vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer", buf = bufnr })
			vim.keymap.set(
				"n",
				"<leader>gp",
				gitsigns.preview_hunk_inline,
				{ desc = "Preview hunk inline", buf = bufnr }
			)

			vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff buffer", buf = bufnr })

			vim.keymap.set("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end, { desc = "Diff buffer against HEAD", buf = bufnr })

			vim.keymap.set("n", "<leader>hQ", function()
				gitsigns.setqflist("all")
			end, { desc = "List all hunks in quickfix" })
			vim.keymap.set("n", "<leader>hq", gitsigns.setqflist, { desc = "List hunks in quickfix", buf = bufnr })

			vim.keymap.set(
				"n",
				"<leader>tb",
				gitsigns.toggle_current_line_blame,
				{ desc = "Toggle line blame", buf = bufnr }
			)

			vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff", buf = bufnr })

			vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk", buf = bufnr })
		end,
	},
}
