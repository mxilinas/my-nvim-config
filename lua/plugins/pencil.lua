return {
    "https://github.com/preservim/vim-pencil",
    lazy = true,
    config = function ()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.cmd("PencilSoft")
            end
        })
    end
}
