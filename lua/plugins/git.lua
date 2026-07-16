return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local gs = require("gitsigns")
			gs.setup({
				current_line_blame = true,
			})

			vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "view changes on the line" })
		end,
	},

	-- Fugitive Git integration
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
			{ "<leader>gD", "<cmd>Git diff<CR>", desc = "Git diff (fugitive)" },
			{ "<leader>gl", "<cmd>Git log --oneline<CR>", desc = "Git log" },
			{ "<leader>gP", "<cmd>Git push<CR>", desc = "Git push" },
			{ "<leader>gF", "<cmd>Git pull<CR>", desc = "Git pull" },
		},
	},

	-- GitHub integration with Octo
	{
		"pwntester/octo.nvim",
		cmd = "Octo",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
}
