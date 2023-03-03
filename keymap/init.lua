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
      -- ["<leader>v"] = '', -- era abrir um terminal na vertical, por causa dos atalhso do vimspector, tirei
      -- ["<leader>e"] = '', -- era focus nvimtree
      ["<return>"] = '', -- era focus nvimtree

      -- me forçar a essa merda
      ['<up>'] = '',
      ['<down>'] = '',
      ['<left>'] = '',
      ['<right>'] = '',
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
  -- vimspector = {
  --   n = {
  --     ['<leader>vG'] = { function()
  --       require('custom.plugins.vimspector').generate_debug_profile()
  --     end, "Generate Debug Profile" },
  --
  --     ['<leader>vH'] = { function()
  --       require('custom.plugins.vimspector').toggle_human_mode()
  --     end, "Toggle HUMAN mode" },
  --
  --     ['<leader>vI'] = { "<cmd>VimspectorInstall<cr>", "Install" },
  --     ['<leader>vU'] = { "<cmd>VimspectorUpdate<cr>", "Update" },
  --     ['<leader>vx'] = { "<cmd>VimspectorReset<cr>", "Reset" },
  --
  --     ['<leader>vR'] = { "<cmd>call vimspector#RunToCursor()<cr>", "Run to Cursor" },
  --     ['<leader>vc'] = { "<cmd>call vimspector#Continue()<cr>", "Continue" },
  --     ['<leader>vi'] = { "<cmd>call vimspector#StepInto()<cr>", "Step Into" },
  --     ['<leader>vo'] = { "<cmd>call vimspector#StepOver()<cr>", "Step Over" },
  --     ['<leader>vs'] = { "<cmd>call vimspector#Launch()<cr>", "Start" },
  --     ['<leader>vt'] = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint" },
  --     ['<leader>vu'] = { "<cmd>call vimspector#StepOut()<cr>", "Step Out" },
  --     ['<leader>vS'] = { "<cmd>call vimspector#Stop()<cr>", "Stop" },
  --     ['<leader>vr'] = { "<cmd>call vimspector#Restart()<cr>", "Restart" },
  --   }
  -- },
  dap = {
    n = {
      ['<leader>vR'] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      ['<leader>vE'] = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      ['<leader>vC'] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      ['<leader>vU'] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      ['<leader>vb'] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      ['<leader>vc'] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      ['<leader>vd'] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      ['<leader>ve'] = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      ['<leader>vg'] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      ['<leader>vh'] = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      ['<leader>vS'] = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      ['<leader>vi'] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      ['<leader>vo'] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      ['<leader>vp'] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      ['<leader>vq'] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      ['<leader>vr'] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      ['<leader>vs'] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      ['<leader>vt'] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      ['<leader>vx'] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      ['<leader>vl'] = { "<cmd>lua require('dap.ext.vscode').load_launchjs(nil, {})<cr>", "Load from launch.json" },
      ['<leader>vu'] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
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
