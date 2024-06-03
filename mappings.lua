---@type MappingsTable
local KeyMap = {
  general = {
    n = {
      ['<C-k>'] = {"<cmd> TroubleToggle <CR>", '[Custom] toggle LSP errors window'},
      ['<Tab>'] = {">>_", '[Custom] indent foward'},
      ['<S-Tab>'] = {"<<_", '[Custom] indent backwards'},

      ['<Backspace>'] = {'viw"_d', '[Custom] delete whole word'},
      ['<enter>'] = {'', ''},
      ['<leader>v'] = {'<cmd> vsplit <CR>', 'split screen vertically'},
      ['<leader>h'] = {'<cmd> split <CR>', 'split screen horizontally'},
      ['<leader>tw'] = {'<cmd> Translate EN<CR>', 'Translate text'},
      ['<leader>tr'] = {'<cmd> TerminalReset<CR>', 'Reset Terminal'},
      ['gr'] = {'<cmd> Trouble lsp_references<CR>', 'LSP references'},
      ['gd'] = {'<cmd> Trouble lsp_definitions<CR>', 'LSP references'},
      ['gD'] = {'<cmd> Trouble lsp_type_definitions<CR>', 'LSP references'},
      ['<C-g>'] = {'<cmd> let @+ = expand("%:p") . ":" . line(".") | echo \'copied \' . @+ . \' to the clipboard.\'<CR>', 'Copy path to clipboard'},
      ['<leader>s'] = {'<cmd> vertical resize 45<CR>', 'Fix side panel'},
      ['<leader>dt'] = {'<cmd> lua require("dapui").toggle()<CR>', 'Toggle DAP UI'},
      ['<leader>db'] = {'<cmd> DapToggleBreakpoint<CR>', 'Toggle DAP Breakpoint'},
      ['<leader>dc'] = {'<cmd> DapContinue<CR>', 'Continue in Debugging'},
      ['<leader>dr'] = {'<cmd> lua require("dapui").open({reset = true})<CR>', 'Reset DAP UI'},
    },
    i = {
      ['<S-Tab>'] = {'<C-D>', '[Custom] indent backwards in insert mode'}
    },
    t = {
      ['<C-x>'] = {'<cmd> TerminalToggle<CR>', 'Toggl terminal while in it'}
    },
    v = {
      ['<Tab>'] = {'>gv', '[Custom] indent foward in select mode'},
      ['<S-Tab>'] = {'<gv', '[Custom] indent backwards in select mode'},
      ['<Backspace>'] = {'"_d', '[Custom] delete selected text without yanking'},
      ['<leader>tw'] = {'<cmd> Translate EN<CR>', 'Translate text'},
    }
  },
  disabled = {
    n = {
      ['<C-s>'] = '', -- save file
      ['<C-c>'] = '', -- copy whole file
      ["<tab>"] = '', -- era padrão de cycle do bufferline
      ["<S-tab>"] = '', -- era padrão de cycle do bufferline
      ["<S-b>"] = '', -- era new buffer, remapeado
      -- ["<leader>v"] = '', -- era abrir um terminal na vertical, por causa dos atalhso do vimspector, tirei
      -- ["<leader>e"] = '', -- era focus nvimtree
      ["<return>"] = '', -- era focus nvimtree
    }
  },
  notify = {
    n = {
      ['<leader>d'] = {function()
        local present, notify = pcall(require, "notify")

        if not present then
          return
        end

        notify.dismiss()
      end, "Dismiss all current messages"}
    }
  },
  tabufline = {
    n = {
      ["gt"] = {
        function()
          require("nvchad.tabufline").tabuflineNext()
        end, "  goto next buffer", "  goto next buffer"
      },
      ["gT"] = {
        function()
          require("nvchad.tabufline").tabuflinePrev()
        end, "  goto prev buffer"
      },
      ["<leader>n"] = { "<cmd> enew <CR>", "烙 new buffer" },
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

return KeyMap;
