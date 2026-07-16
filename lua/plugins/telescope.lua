return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			-- Telescope configuration
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			telescope.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					layout_config = {
						horizontal = { prompt_position = "bottom" },
					},
				},
				extensions = {
					["ui-select"] = {
						themes.get_dropdown(),
					},
				},
			})

			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "ui-select")

			-- Keybindings
			local map = vim.keymap.set

			map("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
			map("n", "<leader>sg", builtin.live_grep, { desc = "Live grep" })
			map("n", "<leader>sw", builtin.grep_string, { desc = "Grep word under cursor" })
			map("n", "<leader>s.", builtin.oldfiles, { desc = "Old files" })
			map("n", "<leader>sh", builtin.help_tags, { desc = "Help tags" })
			map("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
			map("n", "<leader>ss", builtin.builtin, { desc = "Builtins" })
			map("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
			map("n", "<leader>s/", function()
				builtin.live_grep({ grep_open_files = true })
			end, { desc = "Live grep (open files)" })
			map("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Find in nvim config" })
			map("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(themes.get_dropdown({ previewer = false }))
			end, { desc = "Buffer fuzzy search" })
			map("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })
		end,
	},
}
