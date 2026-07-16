return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Oil file explorer configuration
			require("oil").setup({
				default_file_explorer = false,
				use_default_keymaps = false,
				view_options = {
					show_hidden = true,
					case_insensitive = false,
					natural_order = "fast",
				},
				float = {
					padding = 2,
					border = "rounded",
					max_width = 0.8,
					max_height = 0.8,
				},
				constrain_cursor = "editable",
				watch_for_changes = false,
				cleanup_delay_ms = 2000,
				keymaps = {
					["q"] = "actions.close",
					["<CR>"] = "actions.select",
					["-"] = "actions.parent",
					["<bs>"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["g."] = "actions.toggle_hidden",
				},
			})

			vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil float explorer" })
		end,
	},

	-- Bufferline tab configuration
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					diagnostics = "nvim_lsp",
					indicator = { icon = "▎" },
					number = "buffer_id",
					separator_style = "slant",
					show_buffer_close_icons = false,
					show_close_icon = false,
				},
			})
		end,
	},

	{
		"tpope/vim-sleuth",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- Toggleterm terminal configuration
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 15,
				open_mapping = false,
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = false,
				direction = "horizontal",
				float_opts = {
					border = "rounded",
				},
				close_on_exit = false,
				shell = vim.o.shell,
				persist_size = true,
				auto_scroll = true,
				on_open = function(term)
					vim.cmd("startinsert!")
					if term and term.window and vim.api.nvim_win_is_valid(term.window) then
						vim.wo[term.window].winhighlight = "WinSeparator:WinSeparator,FloatBorder:WinSeparator"
					end
				end,
				highlights = {
					FloatBorder = {
						link = "WinSeparator",
					},
				},
			})

			require("config.term").setup_keymaps()
		end,
	},
}
