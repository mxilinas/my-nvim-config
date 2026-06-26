local map = vim.keymap.set

map("n", "<Leader>bs", function()
    local buf = vim.api.nvim_create_buf(true, true) -- listed = true, scratch = true
    vim.api.nvim_set_current_buf(buf)
end, { desc = "Open a new scratch buffer" })

map("n", "<Leader>e", "<Cmd>Oil<CR>", { desc = "Open file explorer" })

map("n", "<Leader>`", function()
    local config = vim.fn.stdpath("config")
    vim.cmd.edit(config)
    vim.cmd("cd " .. vim.fn.fnameescape(config))
end, { desc = "Open config" })

map("n", "<Leader>cdr", function()
    local buf = 0

    -- try LSP roots first
    local clients = vim.lsp.get_clients({ bufnr = buf })
    for _, client in ipairs(clients) do
        if client and client.root_dir then
            vim.cmd("cd " .. vim.fn.fnameescape(client.root_dir))
            return
        end
    end

    -- fallback: filesystem root detection
    local root = vim.fs.root(buf, { ".git", "lua", "package.json", "go.mod" })

    if root then
        vim.cmd("cd " .. vim.fn.fnameescape(root))
    else
        vim.notify("No project root found", vim.log.levels.WARN)
    end
end, { desc = "cd to project root" })

map("n", "<Leader>cdd", function()
    local dir = vim.fn.expand("%:p:h")
    vim.cmd("cd " .. vim.fn.fnameescape(dir))
end, { desc = "cd to current file dir" })

map({ "n", "v", "x" }, "<leader>y", '"+y')

-- Misc Normal Mode Keymaps
map("n", "<Backspace>", "<C-6>", { desc = "Go to the previous buffer" })
map("n", "<C-s>", "<Cmd>w<Cr>", { desc = "Save the current file" })

-- Adding whitespace
vim.api.nvim_set_keymap("n", "<C-n>", "]<Space>", { desc = "Add a space below the current line" })
vim.api.nvim_set_keymap("n", "<C-m>", "[<Space>", { desc = "Add a space above the current line" })

-- Keep cursor centered on center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Keep cursor in place when joining lines
map("n", "J", "mzJ`z")

-- Moving lines
map("n", "<C-j>", function()
    pcall(vim.api.nvim_command, "move +1,.")
end, { desc = "Move line down", silent = true })
map("n", "<C-k>", function()
    pcall(vim.api.nvim_command, "move -2,.")
end, { desc = "Move line up", silent = true })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Tab navigation
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprev<cr>", { desc = "Previous buffer" })

-- Jump to start/end of line
map("n", "0", "^", { desc = "Jump to first character of the line" })
map("n", "^", "0", { desc = "Jump to first character (alternative)" })

-- Command-line navigation
map("c", "<Tab>", "<Up>", { desc = "Previous command" })
map("c", "<S-Tab>", "<Down>", { desc = "Next command" })

-- Open terminal
map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Open Terminal" })
