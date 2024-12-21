-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Theme Catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- Style (mocha, latte, frappe, macchiato)
        transparent_background = true, -- Transparent bg
        term_colors = true, -- Terminal colors
        color_overrides = {
          mocha = {
            Keyword = { fg = '#f5a97f', bold = true },
            Function = { fg = '#8aadf4', style = { 'bold', 'italic' } },
            String = { fg = '#a6da95', bg = 'none' }, -- Soft bright in strings
          },
        },
        integrations = {
          telescope = true, -- Telescope integration
          mason = true, -- Mason.nvim suport
          Neotree = true, -- Neotree integration
        },
      }
      vim.cmd 'colorscheme catppuccin'
    end,
  },

  {
    'startup-nvim/startup.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
    config = function()
      require('startup').setup { theme = 'evil' }
    end,
  },
}
