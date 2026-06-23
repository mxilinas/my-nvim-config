return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install",
    config = function ()
        vim.g.mkdp_combine_preview = 0
        -- vim.keymap.set("n", "<leader>m", "<Plug>MarkdownPreviewToggle<Plug>", {desc = "Toggle Markdown-Preview"})
    end
}
