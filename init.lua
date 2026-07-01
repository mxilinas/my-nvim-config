require("config.lazy-bootstrap")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "gruvbox" } },
	checker = { enabled = false },
	rocks = { enabled = false },
})

require("config.autocommands")
require("config.keymaps")
require("config.sets")
require("config.lsp")
