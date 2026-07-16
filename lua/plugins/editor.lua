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

	-- Neo-tree file explorer configuration
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "\\", "<cmd>Neotree filesystem reveal left<CR>", desc = "Reveal file in Neo-tree (sidebar)" },
			{ "<leader>e", "<cmd>Neotree toggle left<CR>", desc = "Toggle Neo-tree sidebar" },
		},
		opts = {
			close_if_last_window = false,
			enable_git_status = true,
			enable_diagnostics = true,
			clipboard = { sync = "none" },
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					highlight = "NeoTreeFileIcon",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
			},
			window = {
				position = "left",
				width = 35,
				mapping_options = { noremap = true, nowait = true },
				mappings = {
					["<space>"] = { "toggle_node", nowait = false },
					["<CR>"] = "open",
					["<esc>"] = "cancel",
					["P"] = { "toggle_preview", config = { use_float = true } },
					["l"] = "focus_preview",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["C"] = "close_node",
					["z"] = "close_all_nodes",
					["a"] = { "add", config = { show_path = "none" } },
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["c"] = "copy",
					["m"] = "move",
					["q"] = "close_window",
					["R"] = "refresh",
					["?"] = "show_help",
					["i"] = "show_file_details",
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["H"] = "toggle_hidden",
					["/"] = "fuzzy_finder",
					["D"] = "fuzzy_finder_directory",
					["#"] = "fuzzy_sorter",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
				},
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
				},
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = false,
			},
			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			},
		},
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
