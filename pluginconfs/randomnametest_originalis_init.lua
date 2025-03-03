---@type NvPluginSpec[]
--
local PluginsConf = {
  {'williamboman/nvim-lsp-installer'},
  -- {
  --   "neovim/nvim-lspconfig",
  --   -- after = "nvim-lsp-installer",
  --   module = "lspconfig",
  --   config = function()
  --     require "custom.pluginconfs.lsp_installer"
  --     require "custom.pluginconfs.configs.lspconfig"
  --     require "custom.pluginconfs.lspconfig"
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  },
  {'bpietravalle/vim-bolt'},
  {'neoclide/vim-jsx-improve'},
  {'ntpeters/vim-better-whitespace'},
  {
    'karb94/neoscroll.nvim',
    config = function()
      require "custom.pluginconfs.neoscroll"
    end,
  },
  {'cakebaker/scss-syntax.vim'},
  {'nvim-telescope/telescope-file-browser.nvim'},
  {'nvim-telescope/telescope-node-modules.nvim'},
  {'nvim-lua/popup.nvim'},
  {'folke/lsp-colors.nvim'},
  {'folke/trouble.nvim'},
  {'othree/html5.vim'},
  {'pangloss/vim-javascript'},
  {'evanleck/vim-svelte'},
  {'wfxr/minimap.vim'},
  {'voldikss/vim-floaterm'},
  {'leafgarland/typescript-vim'},
  {'SmiteshP/nvim-navic'},
  {"mhinz/vim-startify"},
  {"thosakwe/vim-flutter"},
  {'wikitopian/hardmode'},

  -- Remove Plugins
  {
    "folke/which-key.nvim",
    enabled = false
  },
  -- {
  --   "williamboman/mason.nvim",
  --   enabled = false
  -- },

  -- override
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "html", "javascript" },
      mode = "foreground"
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { 'node_modules', 'venv', '.venv', "%.png", "%.jpg", "%.zip", "%.gif", "%.ico", "%.woff2", "%.ttf", "%.xcf", "%.woff", 'docs', '*_test.go' }
      },
      extensions_list = {
        "file_browser"
      }
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filesystem_watchers = {
        ignore_dirs = {'__pycache__'}
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
  {
    'NvChad/ui',
    opts = {
      statusline = {
        overriden_modules = function()
          return {
            LSP_status = nil
          }
        end,
      },
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
