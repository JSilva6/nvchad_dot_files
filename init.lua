local opt = vim.opt

opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.foldenable = false
opt.foldmethod = 'indent'

vim.api.nvim_command('set smarttab')
vim.api.nvim_command('set cindent')
vim.api.nvim_command('set expandtab')

vim.api.nvim_exec([[
function TrailingFix()
  exec '%s/\s\+$//e'
  endfunction
  command! TrailingFix call TrailingFix()

  function OpenFloatingTerminal(...)
    let command = 'FloatermNew --position=topright --width=0.5 --height=0.5 --autoclose=0 ' . join(a:000)
    execute command
    echo command
  endfunction
  command! -nargs=* Terminal call OpenFloatingTerminal(<f-args>)
]], true)

require "custom.plugins.neoscroll"
require "custom.plugins.hardmode"
require "custom.plugins.flutter"
