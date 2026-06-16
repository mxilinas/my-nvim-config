return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black", lsp_format = "fallback" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            cpp = { "clangd-format", lsp_format = "fallback" },
        },
    },
    config = function()
        _G._conform_operator = function()
            local start = vim.api.nvim_buf_get_mark(0, "[")
            local finish = vim.api.nvim_buf_get_mark(0, "]")

            require("conform").format({
                async = true,
                lsp_format = "fallback",
                range = {
                    start = start,
                    ["end"] = finish,
                },
            })
        end

        vim.keymap.set("v", "<leader>lf", function()
            require("conform").format({
                async = true,
                lsp_format = "fallback",
                range = {
                    start = vim.api.nvim_buf_get_mark(0, "<"),
                    ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                },
            })
        end, { desc = "Format selection" })

        vim.keymap.set("n", "<leader>lff", function()
            require("conform").format({
                async = true,
                lsp_format = "fallback",
            })
        end, { desc = "Format file" })

        vim.keymap.set("n", "<leader>lf", function()
            vim.o.operatorfunc = "v:lua._conform_operator"
            return "g@"
        end, {
            expr = true,
            desc = "Format (operator)",
        })
    end,
}
