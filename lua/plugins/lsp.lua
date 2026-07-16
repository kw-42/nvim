return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			-- LSP setup with Mason and Mason LSP Config
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
							format = { enable = false },
						},
					},
				},
				ts_ls = {},
				kotlin_language_server = {},
				jdtls = {},
				rust_analyzer = {},
				clangd = {},
			}

			local ok_mason, mason = pcall(require, "mason")
			if ok_mason and type(mason.setup) == "function" then
				mason.setup({})
			end

			local ensure_installed = {
				"lua-language-server",
				"typescript-language-server",
				"kotlin-language-server",
				"jdtls",
				"rust-analyzer",
				"clangd",
				"stylua",
				"prettier",
				"ktfmt",
				"google-java-format",
			}

			local ok_mti, mti = pcall(require, "mason-tool-installer")
			if ok_mti and type(mti.setup) == "function" then
				mti.setup({
					ensure_installed = ensure_installed,
					auto_update = false,
					run_on_start = true,
				})
			end

			local ok_mreg, mreg = pcall(require, "mason-registry")
			if ok_mreg then
				for _, pkg_name in ipairs(ensure_installed) do
					local ok_pkg, pkg = pcall(mreg.get_package, pkg_name)
					if ok_pkg and pkg and not pkg:is_installed() then
						pkg:install()
						vim.notify("mason: installing " .. pkg_name .. " (background)", vim.log.levels.INFO)
					end
				end
			else
				vim.schedule(function()
					vim.notify(
						"mason-registry not available; missing tools won't be auto-installed",
						vim.log.levels.WARN
					)
				end)
			end

			-- Setup servers using the new vim.lsp.config API
			for server_name, server_config in pairs(servers) do
				local server = vim.tbl_deep_extend("force", server_config, {
					capabilities = vim.tbl_deep_extend("force", capabilities, server_config.capabilities or {}),
				})
				vim.lsp.config(server_name, server)
			end

			-- Enable all configured servers
			vim.lsp.enable({ "lua_ls", "ts_ls", "kotlin_language_server", "jdtls", "rust_analyzer", "clangd" })

			-- Setup mason-lspconfig for auto-installation
			local ok_mlsp, mlsp = pcall(require, "mason-lspconfig")
			if ok_mlsp then
				mlsp.setup({})
			end

			-- Diagnostic signs and configuration
			vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "I", texthl = "DiagnosticSignInfo" })

			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = true },
				signs = true,
				underline = true,
				virtual_text = true,
			})
		end,
	},

	-- Completion with nvim-cmp and LuaSnip
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			{ "L3MON4D3/LuaSnip" },
			"saadparwaiz1/cmp_luasnip",
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetipe = { "TelescopePrompt", "vim" },
				},
			},
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local autopairs = require("nvim-autopairs")

			luasnip.config.setup({})
			autopairs.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true })
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 1000 },
					{ name = "luasnip", priority = 750 },
					{ name = "buffer", priority = 500 },
					{ name = "path", priority = 250 },
				}),
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
