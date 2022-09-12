local M = {}

M.ui = require "custom.ui"
M.plugins = require "custom.plugins"
M.mappings = {
  general = {
    n = {
      ['<C-k>'] = {"<cmd> TroubleToggle <CR>", '[Custom] toggle LSP errors window'},
      ['<Tab>'] = {">>_", '[Custom] indent foward'},
      ['<S-Tab>'] = {"<<_", '[Custom] indent backwards'},

      ['<Backspace>'] = {'viw"_d', '[Custom] delete whole word'},
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
      ["gt"] = {
        function()
          require("core.utils").tabuflineNext()
        end, "  goto next buffer", "  goto next buffer"
      },
      ["gT"] = {
        function()
          require("core.utils").tabuflinePrev()
        end, "  goto prev buffer"
      },
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

return M
