local navic_enabled, navic = pcall(require, "nvim-navic")
local lspconfig = require "lspconfig"
local config = require "custom.pluginconfs.configs.lspconfig"

local attach = config.on_attach
local capabilities = config.capabilities

local function contains(list, x)
  for _, v in pairs(list) do
    if v == x then return true end
  end
  return false
end

local servers = require "custom.languages.list"
local navic_exclusion = {"html", "emmet_ls", "cssls", "quick_lint_js", "stylelint_lsp", "golangci_lint_ls"}

local settings = {
  ["pyright"] = {
    python = require('custom.languages.python').conf
  }
}

local on_attach_function

if not navic_enabled then
  on_attach_function = attach
else
  on_attach_function = function(client, bufnr)
    attach(client, bufnr)
    navic.attach(client, bufnr)
  end
end


for _, lsp in ipairs(servers) do
  local has_custom_opts, server_custom_opts =
    pcall(require, 'gmr.configs.lsp.settings.' .. lsp)

  local server_opts = {
    on_attach = (contains(navic_exclusion, lsp) and attach or on_attach_function),
    capabilities = capabilities,
  }

  if settings[lsp] then
    server_opts = vim.tbl_deep_extend("force", server_opts, {
      settings = settings[lsp]
    })
  end

  if has_custom_opts then
    server_opts = vim.tbl_deep_extend("force", server_opts, server_custom_opts)
  end

  lspconfig[lsp].setup(server_opts)
end
