--- Return the severity-level of the highest existing severity.
local function get_max_severity()
	local max_severity = vim.diagnostic.severity.HINT
	local diagnostics = vim.diagnostic.get(0)

	for _, d in pairs(diagnostics) do
		if d.severity < max_severity then
			max_severity = d.severity
		end
	end
	return max_severity
end

local setup_lsp_attach = function(args)
	local wk = require("which-key")

	local client = vim.lsp.get_client_by_id(args.data.client_id)
	if not client then
		return
	end

	vim.wo.signcolumn = "yes"
	vim.o.winborder = "single"

	wk.add({
		{
			"]d",
			function()
				vim.diagnostic.jump({
					count = 1,
					severity = get_max_severity(),
					wrap = true,
				})
				vim.schedule(function()
					vim.diagnostic.open_float({
						anchor_bias = "below",
						focus = false,
						scope = "cursor",
					})
				end)
			end,
			desc = "Next diagnostic",
			buffer = 0,
		},
		{
			"[d",
			function()
				vim.diagnostic.jump({
					count = -1,
					severity = get_max_severity(),
					wrap = true,
				})
				vim.schedule(function()
					vim.diagnostic.open_float({
						anchor_bias = "below",
						focus = false,
						scope = "cursor",
					})
				end)
			end,
			desc = "Previous diagnostic",
			buffer = 0,
		},
		-- LSP actions
		{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol", buffer = 0 },
		{ "<f3>", vim.lsp.buf.code_action, desc = "Code action", buffer = 0 },
		{ "gd", vim.lsp.buf.definition, desc = "Go to definition", buffer = 0 },
		{ "gD", vim.lsp.buf.declaration, desc = "Go to declaration", buffer = 0 },
		{ "gi", vim.lsp.buf.implementation, desc = "Go to implementation", buffer = 0 },
		{ "<leader>lr", vim.lsp.buf.references, desc = "Show references", buffer = 0 },
		{ "<leader>li", vim.lsp.buf.implementation, desc = "Show impl.", buffer = 0 },
		{ "<leader>lt", vim.lsp.buf.type_definition, desc = "Go to type definition", buffer = 0 },
		{ "<leader>ls", vim.lsp.buf.document_symbol, desc = "Show document symbols", buffer = 0 },
		{
			"K",
			function()
				vim.lsp.buf.hover({
					anchor_bias = "below",
					title_pos = "center",
				})
			end,
			desc = "Hover documentation",
			buffer = 0,
		},
		{
			"gl",
			function()
				vim.diagnostic.open_float({
					anchor_bias = "below",
				})
			end,
			desc = "Show diagnostics",
			buffer = 0,
		},
		{
			"<C-k>",
			function()
				vim.lsp.buf.signature_help({
					anchor_bias = "below",
				})
			end,
			desc = "Signature help",
			mode = "i",
			buffer = 0,
		},
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = setup_lsp_attach,
})

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = true,
	float = true,
	severity_sort = true,
})

require("config.lsp.languages.lua_ls")
require("config.lsp.languages.pyright")
