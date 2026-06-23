vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "typescriptreact", "javascriptreact", "css" },
	callback = function()
		vim.bo.fo = "tcroq"
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.o.expandtab = true
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function(args)
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.o.expandtab = true
		vim.keymap.set("n", "<leader>rr", "<Cmd>:w<Cr><Cmd>make run<Cr>", {
			buffer = args.buf,
			desc = "Run the current cpp file",
		})
		vim.keymap.set("n", "<leader>rR", "<Cmd>:w<Cr><Cmd>silent make run<Cr>", {
			buffer = args.buf,
			desc = "Run the current cpp file silently",
		})
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "python",
	callback = function(args)
		vim.keymap.set("n", "<leader>rp", "<Cmd>:w<Cr><Cmd>!python %:p<Cr>", {
			buffer = args.buf,
			desc = "Run the current python file",
		})
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "help",
	callback = function()
		vim.wo.signcolumn = "no"
		vim.wo.colorcolumn = ""
		vim.wo.number = false
		vim.wo.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
	vim.keymap.set("n", "<CR>", "<CR><C-w>p", {
		buffer = true,
		remap = false,
		silent = true,
		desc = "Go to the item under the cursor; stay in the qf window.",
	})
  end,
})
