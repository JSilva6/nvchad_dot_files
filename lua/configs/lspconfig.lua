require("nvchad.configs.lspconfig").defaults()

local servers = {
  "ts_ls",
  "clangd",
  "dartls",
  "pyright",
  "stylelint_lsp",
  "svelte",
  -- "angularls",
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
-- local project_library_path = vim.fn.stdpath("data")
--   .. "/mason/packages/angularls/node_modules/@angular/language-server"
--
-- local cmd = {
--   "ngserver",
--   "--stdio",
--   "--tsProbeLocations", project_library_path,
--   "--ngProbeLocations", project_library_path,
-- }
--
-- vim.lsp.config("angularls", {
--   cmd = cmd,
-- })

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

-------------------------- gopls (pinned) --------------------------
-- Certifique-se de ter instalado com:
--   go install golang.org/x/tools/gopls@v0.15.3
-- e que $HOME/go/bin está no PATH do seu shell.
vim.lsp.config("gopls", {
  cmd = { vim.fn.expand("$HOME/go/bin/gopls") },
  settings = {
    gopls = {
      -- ajustes comuns; pode adaptar ao seu gosto
      analyses = { unusedparams = true, unreachable = true },
      staticcheck = false,
      usePlaceholders = true,
      -- gofumpt = true,       -- se você usa gofumpt via gopls
      -- hints = { assignVariableTypes = true, parameterNames = true },
    },
  },
})

--------------------- golangci_lint_ls (usa golangci-lint v2) ---------------------
-- Instale o CLI (binário) sem depender do go local:
--   curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh \
--     | sh -s -- -b "$(go env GOPATH)"/bin v2.4.0
--
-- E (opcional) instale o langserver por release:
--   pegue o binário 'golangci-lint-langserver' e deixe no PATH (ex.: ~/.local/bin)
--
-- Importante: no v2 a flag de JSON mudou para --output.json.path=stdout
vim.lsp.config("golangci_lint_ls", {
  cmd = { "golangci-lint-langserver" },  -- binário do LS (ex.: de release)
  init_options = {
    command = {
      vim.fn.expand("$HOME/go/bin/golangci-lint"),
      "run",
      "--out-format=json",   -- v2: mande JSON no stdout pro LS
      "--issues-exit-code=1",
      -- "--show-stats=false",       -- opcional; dep. da sua preferência
      -- "--fast-only",              -- opcional: acelera no editor
      -- NÃO habilite/disable linters aqui; prefira o .golangci.yml do projeto
    },
  },
})

-- Por fim, habilite os servidores listados
vim.lsp.enable(servers)
