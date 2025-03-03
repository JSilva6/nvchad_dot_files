local function trailing_fix()
  vim.cmd('%s/\\s\\+$//e')
end

local function WriteCreatingDirs()
    vim.fn.system({'mkdir', '-p', vim.fn.expand('%:h')})
    vim.cmd('write')
end

vim.api.nvim_create_user_command('W', WriteCreatingDirs, {})
vim.api.nvim_create_user_command('TrailingFix', trailing_fix, {})
