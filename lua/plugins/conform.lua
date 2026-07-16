return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    kotlin = { "ktfmt" },
                    java = { "google-java-format" },
                    javascript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                    rust = { "rustfmt" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                },
                format_on_save = {
                    enabled = true,
                    timeout_ms = 3000,
                    lsp_format = "fallback",
                },
            })

            vim.keymap.set("n", "<leader>f", function()
                require("conform").format({ async = true, lsp_format = "fallback" })
            end)
        end,
    },
}
