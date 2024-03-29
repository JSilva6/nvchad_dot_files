local navic_enabled, navic = pcall(require, "nvim-navic")
local lspconfig = require "lspconfig"
local config = require "custom.plugins.configs.lspconfig"

local attach = config.on_attach
local capabilities = config.capabilities

local function contains(list, x)
  for _, v in pairs(list) do
    if v == x then return true end
  end
  return false
end

local servers = { "html", "cssls", "bashls", "emmet_ls", "tsserver", "clangd", "dartls", "pyright", "stylelint_lsp"}
local navic_exclusion = {"html", "emmet_ls", "cssls", "quick_lint_js", "stylelint_lsp"}

local settings = {
  ["pyright"] = {
    python = {
      analysis = {
        diagnosticMode = 'openFilesOnly',
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = 'information',
          -- strictParameterNoneValue = false,

          reportOptionalSubscript = "none",
          reportOptionalMemberAccess = "none",
          reportOptionalCall = "none",
          reportOptionalIterable = "none",
          reportOptionalContextManager = "none",
          reportOptionalOperand = "none",

          reportIncompatibleVariableOverride = false,
          reportUnboundVariable = "none",
        }
      }
    }
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
  lspconfig[lsp].setup {
    on_attach = (contains(navic_exclusion, lsp) and attach or on_attach_function),
    capabilities = capabilities,
    settings = (settings[lsp] or {})
  }
end
