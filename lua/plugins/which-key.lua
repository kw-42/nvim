return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "classic",
			delay = 200,
			win = {
				border = "rounded",
				title = false,
			},
			spec = {
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "terminal" },
				{ "<leader>w", group = "window" },
				{ "<leader>g", group = "git" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = true })
				end,
				desc = "Show keymaps",
			},
		},
	},
}
