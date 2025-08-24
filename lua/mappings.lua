require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

-- GENERAL --------------------------
-- Normal mode
map("n", "<C-k>", "<cmd> Trouble toggle <CR>", { desc = "[Custom] toggle LSP errors window" })
map("n", "<Tab>", ">>_", { desc = "[Custom] indent forward" })
map("n", "<S-Tab>", "<<_", { desc = "[Custom] indent backwards" })

map("n", "<Backspace>", 'viw"_d', { desc = "[Custom] delete whole word" })
map("n", "<enter>", "", { desc = "" })
map("n", "<leader>v", "<cmd> vsplit <CR>", { desc = "split screen vertically" })
map("n", "<leader>h", "<cmd> split <CR>", { desc = "split screen horizontally" })
map("n", "<leader>tw", "<cmd> Translate EN<CR>", { desc = "Translate text" })
map("n", "<leader>tr", "<cmd> TerminalReset<CR>", { desc = "Reset Terminal" })
map("n", "gr", "<cmd> Trouble lsp_references<CR>", { desc = "LSP references" })
map("n", "gd", "<cmd> Trouble lsp_definitions<CR>", { desc = "LSP definitions" })
map("n", "gD", "<cmd> Trouble lsp_type_definitions<CR>", { desc = "LSP type definitions" })
map(
  "n",
  "<C-g>",
  "<cmd> let @+ = expand('%:p') . ':' . line('.') | echo 'copied ' . @+ . ' to the clipboard.'<CR>",
  { desc = "Copy path to clipboard" }
)
map("n", "<leader>s", "<cmd> vertical resize 45<CR>", { desc = "Fix side panel" })
map("n", "<leader>dt", "<cmd> lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })
map("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", { desc = "Toggle DAP Breakpoint" })
map("n", "<leader>dc", "<cmd> DapContinue<CR>", { desc = "Continue Debugging" })
map("n", "<leader>dr", "<cmd> lua require('dapui').open({reset = true})<CR>", { desc = "Reset DAP UI" })

-- Insert mode
map("i", "<S-Tab>", "<C-D>", { desc = "[Custom] indent backwards in insert mode" })

-- Terminal mode
map("t", "<C-x>", "<cmd> TerminalToggle<CR>", { desc = "Toggle terminal while in it" })

-- Visual mode
map("v", "<Tab>", ">gv", { desc = "[Custom] indent forward in select mode" })
map("v", "<S-Tab>", "<gv", { desc = "[Custom] indent backwards in select mode" })
map("v", "<Backspace>", '"_d', { desc = "[Custom] delete selected text without yanking" })
map("v", "<leader>tw", "<cmd> Translate EN<CR>", { desc = "Translate text" })

-- DISABLED (removed NvChad defaults)
del("n", "<C-s>") -- save file
del("n", "<C-c>") -- copy whole file
del("n", "<tab>") -- bufferline cycle
del("n", "<S-tab>") -- bufferline cycle backwards
del("n", "<return>") -- focus nvimtree

-- NOTIFY ----------------------------
map("n", "<leader>d", function()
  local present, notify = pcall(require, "notify")
  if not present then
    return
  end
  notify.dismiss()
end, { desc = "Dismiss all current messages" })

-- TABUFLINE -------------------------
map("n", "gt", function()
  require("nvchad.tabufline").next()
end, { desc = "  goto next buffer" })

map("n", "gT", function()
  require("nvchad.tabufline").prev()
end, { desc = "  goto prev buffer" })

map("n", "<leader>n", "<cmd> enew <CR>", { desc = "烙 new buffer" })

-- NVIMTREE --------------------------
map("n", "<C-m>", "<cmd> NvimTreeFocus <CR>", { desc = "   focus nvimtree" })

---------------------- neoscroll -------------------------------
local modes = { "n", "v", "x" }

map(modes, "<S-Up>", function()
  require("neoscroll").scroll(-0.95, { move_cursor = false, duration = 250 })
end)

map(modes, "<S-Down>", function()
  require("neoscroll").scroll(0.95, { move_cursor = false, duration = 250 })
end)

map(modes, "<C-u>", function()
  require("neoscroll").scroll(-0.5, { move_cursor = false, duration = 100 })
end)

map(modes, "<C-d>", function()
  require("neoscroll").scroll(0.5, { move_cursor = false, duration = 100 })
end)

map(modes, "z.", function()
  require("neoscroll").zz { half_win_duration = 250 }
end)

map(modes, "zz", function()
  require("neoscroll").zz { half_win_duration = 250 }
end)

-- TELESCOPE -------------------------
map("n", "<C-p>", "<cmd> Telescope find_files <CR>", { desc = "  find files" })

map("n", "<C-f>", function()
  local state = require "telescope.state"
  local cached_pickers = state.get_global_key "cached_pickers"
  if cached_pickers and cached_pickers[1].prompt_title == "Live Grep" then
    require("telescope.builtin").resume()
  else
    vim.api.nvim_command "Telescope live_grep"
  end
end, { desc = "   live grep" })

map("n", "<C-o>", "<cmd> Telescope file_browser <CR>", { desc = "   open file" })
map("n", "<leader>node>", "<cmd> Telescope node_modules list<CR>", { desc = "   list node_module packages" })

