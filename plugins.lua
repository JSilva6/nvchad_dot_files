---@type NvPluginSpec[]
--

-- local PluginsConf = {}
local PluginsConf = {
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    "shime/vim-livedown",
    lazy = false
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    init = function()
      require('dapui').setup()
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    init = function()
      require('nvim-dap-virtual-text').setup()
    end
  },
  {
    "leoluz/nvim-dap-go",
    lazy = false,
    init = function()
      require('dap-go').setup()
    end
  },
  {
    'f-person/git-blame.nvim',
    lazy = false
  },
  {
    'prisma/vim-prisma',
    lazy = false
  },
  {
    'williamboman/nvim-lsp-installer',
    -- init = function()
      -- require("core.utils").lazy_load "vim-jsx-improve"
    -- end,
  },
  -- {
  --   'edluffy/hologram.nvim',
  --   lazy = false,
  --   init = function()
  --     require('hologram').setup{
  --       auto_display = true -- WIP automatic markdown image display, may be prone to breaking
  --     }
  --   end
  -- },
  {
    'rhysd/git-messenger.vim',
    lazy = false,
  },
  {
    "utilyre/barbecue.nvim",
    lazy = false,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    'uga-rosa/translate.nvim',
    -- init = function()
    --   require("core.utils").lazy_load "translate"
    -- end,
    config = function()
      require "custom.pluginconfs.translate"
    end,
    lazy = false
  },
  {
    'safv12/andromeda.vim',
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    --   -- format & linting
    --   {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function()
    --       require "custom.configs.null-ls"
    --     end,
    --   },
      -- },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    'ntpeters/vim-better-whitespace',
    init = function()
      require("core.utils").lazy_load "vim-better-whitespace"
    end,
  },
  {
    'karb94/neoscroll.nvim',
    init = function()
      require("core.utils").lazy_load "neoscroll.nvim"
    end,
    config = function()
      require "custom.pluginconfs.neoscroll"
    end,
  },
  {
    'voldikss/vim-floaterm',
    lazy = false,
    init = function()
      require("core.utils").lazy_load "vim-floaterm"
    end
  },
  {'nvim-telescope/telescope-file-browser.nvim'},
  {'nvim-telescope/telescope-node-modules.nvim'},
  {
    'folke/trouble.nvim',
    version = "v2.10.0",
    init = function()
      require("core.utils").lazy_load "trouble.nvim"
    end,
  },

  {
    'cakebaker/scss-syntax.vim',
    lazy = false
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    lazy = false,
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
  {
    'othree/html5.vim',
    lazy = false
  },
  {
    'HerringtonDarkholme/yats.vim',
    lazy = false
  },
  {
    'sheerun/vim-polyglot',
    lazy = false
  },
  {
    'evanleck/vim-svelte',
    lazy = false
  },
  {
    "mhinz/vim-startify",
    lazy = false
  },
  {
    "thosakwe/vim-flutter",
    lazy = false
  },
  -- {'wikitopian/hardmode'},

  -- Remove Plugins
  {
    "folke/which-key.nvim",
    enabled = false
  },

  -- override
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = {
        'css',
        'javascript',
        html = { mode = 'foreground'; }
      },
    }
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_insalled = require "custom.languages.list"
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { 'node_modules', "%.png", "%.jpg", "%.zip", "%.gif", "%.ico", "%.woff2", "%.ttf", "%.xcf", "%.woff", 'docs', '%_test.go', '%.lock' }
      },
      extensions_list = {
        "file_browser", "themes", "terms"
      }
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        ignore = false,
        enable = true
      },
      filesystem_watchers = {
        ignore_dirs = {'__pycache__'}
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        }
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
        "lua",
        "python"
      }
    },
  },
}


return PluginsConf;
