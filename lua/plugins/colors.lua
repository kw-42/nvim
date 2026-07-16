return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				float = {
					transparent = true,
				},
				term_colors = true,
				integrations = {
					telescope = {
						enabled = true,
					},
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
