return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Gitsigns configuration
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				on_attach = function(bufnr)
					local gs = require("gitsigns")
					local map = function(mode, keys, func, desc)
						vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
					end

					map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
				end,
			})
		end,
	},

	-- Fugitive Git integration
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		keys = {
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
			{ "<leader>gd", "<cmd>Gvdiff<CR>", desc = "Git diff (fugitive)" },
			{ "<leader>gD", "<cmd>Gvdiffsplit!<CR>", desc = "Git diff split (fugitive)" },
			{ "<leader>gl", "<cmd>Git log --oneline<CR>", desc = "Git log" },
			{ "<leader>gP", "<cmd>Git push<CR>", desc = "Git push" },
			{ "<leader>gF", "<cmd>Git pull<CR>", desc = "Git pull" },
		},
	},
}
