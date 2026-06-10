return {
	"hedyhli/outline.nvim",
	config = function()
		vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
		require("outline").setup({
			symbol_folding = {
				markers = { "▸", "▾" },
			},
			guides = {
				markers = {
					bottom = "└─",
					middle = "├─",
					vertical = "│ ",
				},
			},
			symbols = {
				icons = {
					File = { icon = "📄", hl = "Identifier" },
					Module = { icon = "📦", hl = "Include" },
					Namespace = { icon = "🧭", hl = "Include" },
					Package = { icon = "📦", hl = "Include" },
					Class = { icon = "C", hl = "Type" },
					Method = { icon = "ƒ", hl = "Function" },
					Property = { icon = "🔧", hl = "Identifier" },
					Field = { icon = "🌿", hl = "Identifier" },
					Constructor = { icon = "🏗", hl = "Special" },
					Enum = { icon = "∈", hl = "Type" },
					Interface = { icon = "🔌", hl = "Type" },
					Function = { icon = "ƒ", hl = "Function" },
					Variable = { icon = "𝑥", hl = "Constant" },
					Constant = { icon = "π", hl = "Constant" },
					String = { icon = "📝", hl = "String" },
					Number = { icon = "#", hl = "Number" },
					Boolean = { icon = "⊨", hl = "Boolean" },
					Array = { icon = "[]", hl = "Constant" },
					Object = { icon = "⦿", hl = "Type" },
					Key = { icon = "🔑", hl = "Type" },
					Null = { icon = "∅", hl = "Type" },
					EnumMember = { icon = "•", hl = "Identifier" },
					Struct = { icon = "S", hl = "Structure" },
					Event = { icon = "⚡", hl = "Type" },
					Operator = { icon = "+", hl = "Identifier" },
					TypeParameter = { icon = "T", hl = "Identifier" },
					Component = { icon = "⚙️", hl = "Function" },
					Fragment = { icon = "🧩", hl = "Constant" },
					TypeAlias = { icon = "≡", hl = "Type" },
					Parameter = { icon = "→", hl = "Identifier" },
					StaticMethod = { icon = "§", hl = "Function" },
					Macro = { icon = "⚙️", hl = "Function" },
				},
			},
		})
	end,
}
