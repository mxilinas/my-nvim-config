local function rm_map(lhs, modes, buf)
    if type(modes) == "string" then
        modes = { modes }
    end

    for _, mode in ipairs(modes) do
        pcall(vim.keymap.del, mode, lhs, { buffer = buf })
    end
end

return {
    "inkarkat/vim-ReplaceWithRegister",
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                rm_map("gri", "n", ev.buf)
                rm_map("gra", { "n", "v" }, ev.buf)
                rm_map("grr", "n", ev.buf)
            end,
        })
    end,
}
