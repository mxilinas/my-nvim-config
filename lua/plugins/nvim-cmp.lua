return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "Gelio/cmp-natdat", config = true },
		"neovim/nvim-lspconfig",
		"tzachar/cmp-ai",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"lukas-reineke/cmp-rg",
		"hrsh7th/cmp-cmdline",
		"amarakon/nvim-cmp-buffer-lines",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-calc",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					scrollbar = true,
				}),
				document_symbolmentation = cmp.config.window.bordered({
					border = "rounded",
				}),
			},
			formatting = {
				format = function(entry, vim_item)
					vim_item.menu = "[" .. entry.source.name .. "]"
					return vim_item
				end,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-a>"] = cmp.mapping(
					cmp.mapping.complete({
						config = {
							sources = cmp.config.sources({
								{ name = "cmp_ai" },
							}),
						},
					}),
					{ "i" }
				),
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					elseif cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					elseif cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "buffer-lines" },
				{ name = "rg" },
				{ name = "path" },
				{ name = "calc" },
				{ name = "natdat" },
				{ name = "lazydev", group_index = 0 },
			},
		})
		cmp.setup.cmdline(":", {
			mapping = {
				["<tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_next_item()
						else
							cmp.complete()
						end
					end,
				},
				["<s-tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_prev_item()
						else
							cmp.complete()
						end
					end,
				},
			},
			sources = {
				{ name = "path" },
				{ name = "cmdline" },
			},
		})
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end,
}
