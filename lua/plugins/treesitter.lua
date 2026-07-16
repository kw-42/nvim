return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
            if ok then
                ts_configs.setup({
                    ensure_installed = {
                        "lua",
                        "javascript",
                        "typescript",
                        "rust",
                        "c",
                        "cpp",
                        "java",
                        "kotlin",
                        "html",
                        "css",
                        "json",
                        "yaml",
                        "toml",
                        "markdown",
                        "bash",
                    },
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },
                    indent = {
                        enable = true,
                    },
                })
            end
        end,
    },

    -- Treesitter context (shows scope while scrolling)
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            enable = true,
            max_lines = 3,
            trim_scope = "outer",
        },
    },
}
