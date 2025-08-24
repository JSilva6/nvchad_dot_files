---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  transparency = true,
  integrations = { "navic" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  hl_add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
    modules = {
      btns = function()
        return ""
      end,
    },
  },
}

return M
