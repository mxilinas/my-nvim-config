return {
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
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
			vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
			vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)

			vim.keymap.set("v", "<leader>hs", function()
				gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "next hunk" })

			vim.keymap.set("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "next hunk" })

			vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer)
			vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer)
			vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
			vim.keymap.set("n", "<leader>hi", gitsigns.preview_hunk_inline)

			vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)

			vim.keymap.set("n", "<leader>hD", function()
				gitsigns.diffthis("~")
			end)

			vim.keymap.set("n", "<leader>hQ", function()
				gitsigns.setqflist("all")
			end)
			vim.keymap.set("n", "<leader>hq", gitsigns.setqflist)

			vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			vim.keymap.set("n", "<leader>tw", gitsigns.toggle_word_diff)

			vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk)
		end,
	},
    config = function ()
        require("gitsigns").setup()
    end
}
