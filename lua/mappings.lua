require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

local function resolve_copy_path()
  local function is_valid(path)
    return path ~= "" and not path:match "^term://"
  end

  local function to_relative(path)
    local relative = vim.fn.fnamemodify(path, ":.")
    relative = vim.fn.simplify(relative)

    if relative:sub(1, 2) == "./" then
      relative = relative:sub(3)
    end

    return relative ~= "" and relative or path
  end

  local current_buf = vim.api.nvim_get_current_buf()
  local current_name = vim.api.nvim_buf_get_name(current_buf)
  local current_type = vim.bo[current_buf].buftype

  if current_type ~= "terminal" and is_valid(current_name) then
    return to_relative(current_name)
  end

  local alt_buf = vim.fn.bufnr "#"
  if alt_buf > 0 then
    local alt_name = vim.api.nvim_buf_get_name(alt_buf)
    if vim.bo[alt_buf].buftype ~= "terminal" and is_valid(alt_name) then
      return to_relative(alt_name)
    end
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
      local buf_type = vim.bo[buf].buftype
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if buf_type ~= "terminal" and is_valid(buf_name) then
        return to_relative(buf_name)
      end
    end
  end

  return ""
end

local function copy_path_to_clipboard()
  local path = resolve_copy_path()

  if path == "" then
    vim.api.nvim_echo({ { "no file path to copy", "WarningMsg" } }, false, {})
    return
  end

  vim.fn.setreg("+", path)
  vim.api.nvim_echo({ { "copied " .. path .. " to the clipboard.", "Normal" } }, false, {})
end

-- GENERAL --------------------------
-- Normal mode
map("n", "<C-k>", "<cmd> Trouble diagnostics toggle<CR>", { desc = "[Custom] toggle LSP errors window" })
map("n", "<Tab>", ">>_", { desc = "[Custom] indent forward" })
map("n", "<S-Tab>", "<<_", { desc = "[Custom] indent backwards" })

map("n", "<Backspace>", 'viw"_d', { desc = "[Custom] delete whole word" })
map("n", "<enter>", "", { desc = "" })
map("n", "<leader>v", "<cmd> vsplit <CR>", { desc = "split screen vertically" })
map("n", "<leader>h", "<cmd> split <CR>", { desc = "split screen horizontally" })
map("n", "<leader>tw", "<cmd> Translate EN<CR>", { desc = "Translate text" })
map("n", "<leader>tr", "<cmd> TerminalReset<CR>", { desc = "Reset Terminal" })
-- subsitutido pelo telescope
-- map("n", "gr", "<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>", { desc = "LSP references" })

map("n", "<C-g>", copy_path_to_clipboard, { desc = "Copy path to clipboard" })
map("t", "<C-g>", function()
  local escape = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
  local enter_insert = vim.api.nvim_replace_termcodes("i", true, false, true)

  vim.api.nvim_feedkeys(escape, "n", false)

  vim.schedule(function()
    copy_path_to_clipboard()
    vim.api.nvim_feedkeys(enter_insert, "n", false)
  end)
end, { desc = "Copy path to clipboard" })
map("n", "<leader>s", "<cmd> vertical resize 45<CR>", { desc = "Fix side panel" })
map("n", "<leader>dt", "<cmd> lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })
map("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>", { desc = "Toggle DAP Breakpoint" })
map("n", "<leader>dc", "<cmd> DapContinue<CR>", { desc = "Continue Debugging" })
map("n", "<leader>dr", "<cmd> lua require('dapui').open({reset = true})<CR>", { desc = "Reset DAP UI" })

map("n", "<up>", "gk", { desc = "Move Up in multiline" })
map("n", "<down>", "gj", { desc = "Move Down in multiline" })

-- Insert mode
map("i", "<S-Tab>", "<C-D>", { desc = "[Custom] indent backwards in insert mode" })

-- Terminal mode
map("t", "<C-x>", function()
  local escape = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
  local term_name = vim.b.floaterm_name

  vim.api.nvim_feedkeys(escape, "n", false)

  vim.schedule(function()
    if term_name and term_name ~= "" then
      vim.api.nvim_cmd({ cmd = "TerminalToggle", args = { term_name } }, {})
    else
      vim.cmd "TerminalToggle"
    end
  end)
end, { desc = "Toggle terminal while in it" })

-- Visual mode
map("v", "<Tab>", ">gv", { desc = "[Custom] indent forward in select mode" })
map("v", "<S-Tab>", "<gv", { desc = "[Custom] indent backwards in select mode" })
map("v", "<Backspace>", '"_d', { desc = "[Custom] delete selected text without yanking" })
map("v", "<leader>tw", "<cmd> Translate EN<CR>", { desc = "Translate text" })

map("v", "<up>", "gk", { desc = "Move Up in multiline" })
map("v", "<down>", "gj", { desc = "Move Down in multiline" })

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
-- deps
local builtin = require("telescope.builtin")
local state   = require("telescope.state")

map("n", "<C-p>", "<cmd> Telescope find_files <CR>", { desc = "  find files" })

map("n", "<C-f>", function()
  local cached_pickers = state.get_global_key "cached_pickers"
  if cached_pickers and cached_pickers[1].prompt_title == "Live Grep" then
    require("telescope.builtin").resume()
  else
    vim.api.nvim_command "Telescope live_grep"
  end
end, { desc = "   live grep" })

map("n", "<C-o>", "<cmd> Telescope file_browser <CR>", { desc = "   open file" })
map("n", "<leader>node>", "<cmd> Telescope node_modules list<CR>", { desc = "   list node_module packages" })

-- opcional: aumentar cache de pickers
require("telescope").setup({
  defaults = { cache_picker = { num_pickers = 50, ignore_empty_prompt = false } },
})

-- memória do último LSP invocado
vim.g._last_lsp_title = vim.g._last_lsp_title or nil

-- util: retoma por título ou reabre
local function _resume_by_title_or_reopen()
  if not vim.g._last_lsp_title then
    return builtin.live_grep()
  end

  local cached = state.get_global_key("cached_pickers") or {}
  for i, pk in ipairs(cached) do
    if pk and pk.prompt_title == vim.g._last_lsp_title then
      return builtin.resume({ cache_index = i })
    end
  end

  -- não achou no cache -> reabrir o builtin correspondente
  if     vim.g._last_lsp_title == "LSP References"        then return builtin.lsp_references()
  elseif vim.g._last_lsp_title == "LSP Definitions"       then return builtin.lsp_definitions()
  elseif vim.g._last_lsp_title == "LSP Type Definitions"  then return builtin.lsp_type_definitions()
  else
    return builtin.live_grep()
  end
end

map("n", "<C-t>", function()
  _resume_by_title_or_reopen()
end, { desc = "retomar último LSP" })

function _G.ApplyLspMappings(bufnr)
  if vim.b[bufnr]._custom_lsp_keys_applied then return end

  -- apaga mapas do plugin, se existirem
  pcall(vim.keymap.del, "n", "gd", { buffer = bufnr })
  pcall(vim.keymap.del, "n", "gD", { buffer = bufnr })
  pcall(vim.keymap.del, "n", "gr", { buffer = bufnr })

  map("n", "gd", function()
    builtin.lsp_definitions()
  end, { buffer = bufnr, desc = "LSP definitions", silent = true })

  map("n", "gD", function()
    builtin.lsp_type_definitions()
  end, { buffer = bufnr, desc = "LSP type definitions", silent = true })

  map("n", "gr", function()
    vim.g._last_lsp_title = "LSP References"
    builtin.lsp_references()
  end, { buffer = bufnr, desc = "LSP references", silent = true })

  vim.b[bufnr]._custom_lsp_keys_applied = true
end

-- COMMENT ------------------------
map("n", "<leader>;", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>;", "gc", { desc = "toggle comment", remap = true })
