local opt = vim.opt

opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.foldenable = false
opt.foldmethod = 'indent'

vim.api.nvim_command('set smarttab')
vim.api.nvim_command('set cindent')
vim.api.nvim_command('set expandtab')

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = nil
end

require "custom.commands.trailing_fix"
require "custom.languages.python"
require "custom.commands.hardmode"
require "custom.commands.flutter"
