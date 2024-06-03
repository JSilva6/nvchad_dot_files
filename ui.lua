local ui = {
  theme = "onedark",
  transparency = true,
  hl_override = {
    Comment = { italic = true }
  },

  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = false,
    overriden_modules = function(modules)
      -- return {
      --   buttons = function()
      --     return ""
      --   end
      -- }
      modules[4] = (function()
        return ""
      end)()
    end,
  },

  statusline = {
    overriden_modules = function(modules)
      -- return {
      --   buttons = function()
      --     return ""
      --   end
      -- }
      modules[4] = (function()
        return ""
      end)()

    end,
  }
}

return ui
