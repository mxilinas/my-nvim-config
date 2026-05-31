vim.api.nvim_create_autocmd({ "Filetype" }, {
    pattern = "typescriptreact",
    callback = function()
        vim.bo.fo = "tcroq"
        vim.bo.tabstop = 2
        vim.bo.shiftwidth = 2
        vim.o.expandtab = true
    end,
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
    pattern = "python",
    callback = function(args)
        vim.keymap.set("n", "<F5>", "<Cmd>:w<Cr><Cmd>!python %:p<Cr>", {
            buffer = args.buf,
            desc = "Run the current python file",
        })
    end,
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
    pattern = "help",
    callback = function()
        vim.o.signcolumn = "no"
        vim.o.colorcolumn = ""
        vim.o.number = false
        vim.o.relativenumber = false
    end,
})
