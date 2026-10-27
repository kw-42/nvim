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
					javascript = { "prefer_oxfmt_or_prettier" },
					javascriptreact = { "prefer_oxfmt_or_prettier" },
					typescript = { "prefer_oxfmt_or_prettier" },
					typescriptreact = { "prefer_oxfmt_or_prettier" },
					json = { "prefer_oxfmt_or_prettier" },
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

			require("conform").formatters.prefer_oxfmt_or_prettier = {
				command = function(self, ctx)
					local has_oxfmt =
						vim.fs.find({ "oxfmt.config.ts", ".oxfmtrc.json" }, { path = ctx.dirname, upward = true })[1]
					if has_oxfmt then
						return "oxfmt"
					end
					return "prettier"
				end,
			}

			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end)
		end,
	},
}
