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
