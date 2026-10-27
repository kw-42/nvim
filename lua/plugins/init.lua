-- plugin spec loader
return {
	{ import = "plugins.alpha" },
	{ import = "plugins.colors" },
	{ import = "plugins.telescope" },
	{ import = "plugins.lsp" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.conform" },
	{ import = "plugins.git" },
	{ import = "plugins.which-key" },
	{ import = "plugins.editor" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
