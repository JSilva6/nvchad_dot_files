local opt = vim.opt

opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.foldenable = false
opt.foldmethod = 'indent'

vim.api.nvim_command('set smarttab')
vim.api.nvim_command('set cindent')
vim.api.nvim_command('set expandtab')

require "custom.commands.trailing_fix"
require "custom.commands.hardmode"
require "custom.commands.flutter"
