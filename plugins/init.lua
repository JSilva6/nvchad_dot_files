local PluginsConf = {
  ['williamboman/nvim-lsp-installer'] = {},
  ["neovim/nvim-lspconfig"] = {
    after = "nvim-lsp-installer",
    module = "lspconfig",
    config = function()
      require "custom.plugins.lsp_installer"
      require "plugins.configs.lspconfig"
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
  ['nvim-treesitter/nvim-treesitter-angular'] = {},
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
    override_options = {
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
