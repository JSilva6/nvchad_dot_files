local M = {}

local function dump(o, indexer)
  if not indexer then indexer = 0 end
  indexer = indexer + 1
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      if type(v) ~= 'function' then
        print(type(v), indexer)
        s = s .. '['..k..'] = ' .. dump(v, indexer) .. ','
      end
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

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
          require("nvchad_ui.tabufline").tabuflineNext()
        end, "  goto next buffer", "  goto next buffer"
      },
      ["gT"] = {
        function()
          require("nvchad_ui.tabufline").tabuflinePrev()
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
      ["<C-f>"] = { function()
        -- abre a pesquisa, restaurando ela caso tenha sido a ultima coisa de telescope usada
        local state = require "telescope.state"
        local cached_pickers = state.get_global_key "cached_pickers"
        if(cached_pickers and cached_pickers[1].prompt_title == 'Live Grep') then
          require('telescope.builtin').resume()
        else
          -- precisa ser assim pra usar as customizações do nvchad
          vim.api.nvim_command('Telescope live_grep')
        end
      end, "   live grep" },
      ["<C-o>"] = { "<cmd> Telescope file_browser <CR>", "   open file" },
      ["<leader>node"] = { "<cmd> Telescope node_modules list<CR>", "   list node_module packages" },
    }
  }
}

return M
