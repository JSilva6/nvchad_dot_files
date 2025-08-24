require("nvchad.configs.lspconfig").defaults()

local servers = {
  "ts_ls",
  "clangd",
  "dartls",
  "pyright",
  "stylelint_lsp",
  "svelte",
  "angularls",
  "golangci_lint_ls",
  "intelephense",
  "gopls",
  "sqlls",
  "csharp_ls",
  "svelte",
  -- "pylsp",
  -- "lua-language-server",
  -- "stylua",
  -- "css-lsp",
  -- "html-lsp",
  -- "typescript-language-server",
  -- "deno",
  -- "prettier",
  -- "clang-format",
}

-------------------------- angularls --------------------------
local project_library_path = vim.fn.stdpath "data"
  .. "/mason/packages/angularls/node_modules/@angular/language-server"

local cmd =
  { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }

vim.lsp.config("angularls", {
  cmd = cmd,
})

-------------------------- pyright --------------------------
vim.lsp.config("pyright", {
  analysis = {
    diagnosticMode = "openFilesOnly",
    -- diagnosticMode = 'workspace',

    autoSearchPaths = true,
    useLibraryCodeForTypes = false,
    diagnosticSeverityOverrides = {
      reportGeneralTypeIssues = "information",
      -- strictParameterNoneValue = false,

      reportOptionalSubscript = "none",
      reportOptionalMemberAccess = "none",
      reportOptionalCall = "none",
      reportOptionalIterable = "none",
      reportOptionalContextManager = "none",
      reportOptionalOperand = "none",
      reportTypedDictNotRequiredAccess = "none",

      reportIncompatibleVariableOverride = false,
      reportUnboundVariable = "none",
    },
  },
})

vim.lsp.enable(servers)
