local PluginsConf = {
  ['williamboman/nvim-lsp-installer'] = {},
  ['mfussenegger/nvim-dap'] = {
    event = "BufReadPre",
    module = { "dap" },
    wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python" },
    requires = {
      "Pocco81/DAPInstall.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      { "leoluz/nvim-dap-go", module = "dap-go" },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    },
    config = function()
      require("custom.plugins.dap").setup()
    end,
  },
  ['puremourning/vimspector'] = {
    -- cmd = { "VimspectorInstall", "VimspectorUpdate" },
    -- fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
    config = function()
      require("custom.plugins.vimspector").setup()
    end,
  },

  ["nvim-lualine/lualine.nvim"] = {
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('custom.plugins.lualine').setup()
    end
  },
  ["folke/noice.nvim"] = {
    config = function()
      require("custom.plugins.noice").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  ["neovim/nvim-lspconfig"] = {
    after = "nvim-lsp-installer",
    module = "lspconfig",
    config = function()
      require "custom.plugins.lsp_installer"
      require "custom.plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ['bpietravalle/vim-bolt'] = {},
  ['neoclide/vim-jsx-improve'] = {},
  ['ntpeters/vim-better-whitespace'] = {},
  ['karb94/neoscroll.nvim'] = {
    config = function()
      require "custom.plugins.neoscroll"
    end,
  },
  ['cakebaker/scss-syntax.vim'] = {},
  ['nvim-telescope/telescope-file-browser.nvim'] = {},
  ['nvim-telescope/telescope-node-modules.nvim'] = {},
  ['nvim-lua/popup.nvim'] = {},
  ['folke/lsp-colors.nvim'] = {},
  ['folke/trouble.nvim'] = {},
  ['othree/html5.vim'] = {},
  ['wfxr/minimap.vim'] = {},
  ['voldikss/vim-floaterm'] = {},
  ['leafgarland/typescript-vim'] = {},
  ['SmiteshP/nvim-navic'] = {},
  ["mhinz/vim-startify"] = {},
  ["thosakwe/vim-flutter"] = {},
  ['wikitopian/hardmode'] = {},

  -- Remove Plugins
  ["folke/which-key.nvim"] = false,
  ["williamboman/mason.nvim"] = false,

  -- override
  ["nvim-telescope/telescope.nvim"] = {
    override_options = {
      defaults = {
        file_ignore_patterns = { 'node_modules', "%.png", "%.jpg", "%.zip", "%.gif", "%.ico", "%.woff2", "%.ttf", "%.xcf", "%.woff" }
      },
      extensions_list = {
        "file_browser"
      }
    },
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_insalled = {
        "vim",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "markdown",
        "angular",
        "dart",
        "lua"
      }
    },
  },
  ['NvChad/ui'] = {
    config = function()
      local present = pcall(require, "nvchad_ui")

      if present then
        local config = require "nvchad_ui.config"
        require "nvchad_ui.tabufline.lazyload"(config.tabufline)
      end
    end,

    override_options = {
      statusline = nil,
      tabufline = {
        lazyload = false,
        overriden_modules = function()
          return {
            buttons = function()
              return ""
            end
          }
        end,
      }
    },
  }
}


return PluginsConf;
