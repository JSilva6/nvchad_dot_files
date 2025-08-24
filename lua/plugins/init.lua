return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  {
    "shime/vim-livedown",
    lazy = false,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    init = function()
      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    init = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "leoluz/nvim-dap-go",
    lazy = false,
    init = function()
      require("dap-go").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    lazy = false,
  },
  {
    "prisma/vim-prisma",
    lazy = false,
  },

  {
    "uga-rosa/translate.nvim",
    cmd = "Translate",
    opts = "configs.translate",
  },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    opts = function()
      return require "configs.neoscroll"
    end,
  },

  {

    "cameron-wags/rainbow_csv.nvim",
    opts = {},
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },

  {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    config = function()
      dofile(vim.g.base46_cache .. "navic")

      require("nvim-navic").setup {
        highlight = true,
        lsp = { auto_attach = true },
      }

      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
  },

  { "mhinz/vim-startify", lazy = false },
  { "folke/which-key.nvim", enabled = false },
  { "rhysd/git-messenger.vim", cmd = "GitMessenger" },
  { "folke/trouble.nvim", cmd = "Trouble", opts = {} },
  { "ntpeters/vim-better-whitespace", event = "BufReadPre" },
  { "nvim-tree/nvim-tree.lua", opts = require "configs.nvimtree" },
  { "nvim-treesitter/nvim-treesitter", opts = require "configs.treesitter" },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "configs.telescope",
    dependencies = {
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-node-modules.nvim" },
    },
  },
}
