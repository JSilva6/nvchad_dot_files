local M = {}

M.ui = {
  theme = "onedark",
  transparency = true,
  hl_override = {
    Comment = { italic = true }
  },
}

M.plugins = {
  user = {
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
    ['ntpeters/vim-better-whitespace'] = {},
    ['karb94/neoscroll.nvim'] = {},
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
    ['wikitopian/hardmode'] = {}
  },
  -- options = {
    --   lspconfig = {
      --     setup_lspconf = "custom.plugins.lspconfig",
      --   },
      -- },
      remove = {
        "folke/which-key.nvim",
        "williamboman/mason.nvim",
      },
      override = {
        ["nvim-telescope/telescope.nvim"] = {
          defaults = {
            file_ignore_patterns = { 'node_modules', "%.png", "%.jpg", "%.svg", "%.zip", "%.gif", "%.ico", "%.woff2", "%.ttf", "%.xcf", "%.woff" }
          },
          extensions_list = {
            "file_browser"
          }
        },
        ["nvim-treesitter/nvim-treesitter"] = {
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
        ['NvChad/ui'] = {
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
        }
      }
    }

    M.mappings = {
      general = {
        n = {
          ['<C-k>'] = {"<cmd> TroubleToggle <CR>", '[Custom] toggle LSP errors window'},
          ['<Tab>'] = {">>_", '[Custom] indent foward'},
          ['<S-Tab>'] = {"<<_", '[Custom] indent backwards'},

          ['<Backspace>'] = {'viw"_d', '[Custom] delete whole word'}
        },
        i = {
          ['<S-Tab>'] = {'<C-D>', '[Custom] indent backwards in insert mode'}
        },
        v = {
          ['<Tab>'] = {'>gv', '[Custom] indent foward in select mode'},
          ['<S-Tab>'] = {'<gv', '[Custom] indent backwards in select mode'},
          ['<Backspace>'] = {'"_d', '[Custom] delete selected text without yanking'}
        }
      },
      disabled = {
        n = {
          ['<C-s>'] = '', -- save file
          ['<C-c>'] = '', -- copy whole file
          ["<TAB>"] = '', -- era padrão de cycle do bufferline
          ["<S-Tab>"] = '', -- era padrão de cycle do bufferline
          ["<S-b>"] = '', -- era new buffer, remapeado
          --["<leader>e"] = '' -- era focus nvimtree

          -- me forçar a essa merda
          ['<up>'] = '',
          ['<down>'] = '',
          ['<left>'] = '',
          ['<right>'] = '',
        }
      },
      tabufline = {
        n = {
          ["gt"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
          ["gT"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },
          ["<leader>b"] = { "<cmd> enew <CR>", "烙 new buffer" },
        }
      },
      nvimtree = {
        n = {
          ["<C-m>"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
        }
      },
      telescope = {
        n = {
          ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "  find files" },
          ["<C-f>"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
          ["<C-o>"] = { "<cmd> Telescope file_browser <CR>", "   open file" },
          ["<leader>node"] = { "<cmd> Telescope node_modules list<CR>", "   list node_module packages" },
        }
      }
    }

    M.options = {
      user = function()
        require "custom.options"
      end,
    }

    return M
