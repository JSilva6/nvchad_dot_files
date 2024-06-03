vim.g["loaded_python3_provider"] = nil

vim.g["python_host_prog"] = "/usr/bin/python2"
vim.g["python3_host_prog"] = "/usr/bin/python3"

M = {}

M.conf ={
  analysis = {
    diagnosticMode = 'openFilesOnly',
    -- diagnosticMode = 'workspace',

    autoSearchPaths = true,
    useLibraryCodeForTypes = false,
    diagnosticSeverityOverrides = {
      reportGeneralTypeIssues = 'information',
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
    }
  }
}

return M
