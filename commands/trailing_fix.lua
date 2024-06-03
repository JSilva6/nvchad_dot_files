local function trailing_fix()
  vim.cmd('%s/\\s\\+$//e')
end

vim.api.nvim_create_user_command('TrailingFix', trailing_fix, {})
