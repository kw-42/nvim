local config_path = vim.fn.stdpath('config')
package.path = package.path .. ';' .. config_path .. '/lua/?/init.lua;' .. config_path .. '/lua/?.lua'

require('config.options')
require('config.keymaps')
require('config.lazy')
require('config')

vim.schedule(function()
  vim.cmd('TSInstallSync')
  vim.schedule(function()
    vim.cmd('exit')
  end, 500)
end)
