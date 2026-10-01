require("config.lazy-bootstrap")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\" -- Used for buffer-local mappings

require("lazy").setup({
	spec = { { import = "plugins" } },
	checker = { enabled = false },
	change_detection = {
		enabled = true,
		notify = false,
	},
	rocks = { enabled = false },
	colorscheme = "onedark",
})

require("config.autocommands")
require("config.keymaps")
require("config.sets")
require("config.lsp")
