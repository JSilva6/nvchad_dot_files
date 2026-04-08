require("nvchad.configs.lspconfig").defaults()

local servers = {
  "ts_ls",
  "clangd",
  "dartls",
  "pyright",
  "stylelint_lsp",
  "svelte",
  -- "angularls",
  "gopls",
  "golangci_lint_ls",
  "intelephense",
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
--------------------- golangci_lint_ls (v1 flags) ---------------------
local GOPATH = vim.fn.expand("$GOPATH")
local GOROOT = vim.fn.expand("$GOROOT")
vim.lsp.config("golangci_lint_ls", {
  cmd = { GOPATH .. "/bin/gci-ls.sh" },  -- use shim, not the ELF directly
  init_options = {
    command = { GOPATH .. "/bin/golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" },
  },
  env = { PATH = GOROOT.."/bin:"..GOPATH.."/bin:"..vim.fn.getenv("PATH") },
})
vim.lsp.enable({ "gopls", "golangci_lint_ls" })

-- Por fim, habilite os servidores listados
vim.lsp.enable(servers)

local aug = vim.api.nvim_create_augroup("my_lsp_key_overrides", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = aug,
  callback = function(args)
    require("configs.lsp_on_attach").apply(args.buf)
  end,
})
