local M = {}

function M.apply(bufnr)
  -- garante que mappings.lua foi carregado
  pcall(require, "mappings")
  -- roda depois do on_attach do plugin
  vim.schedule(function()
    if _G.ApplyLspMappings then _G.ApplyLspMappings(bufnr) end
  end)
end

return M

