local M = {}

local utils = require "custom.utils"

local vimspector_python = [[
{
  "configurations": {
    "<name>: Launch": {
      "adapter": "debugpy",
      "configuration": {
        "name": "Python: Launch",
        "type": "python",
        "request": "launch",
        "python": "%s",
        "stopOnEntry": true,
        "console": "externalTerminal",
        "debugOptions": [],
        "program": "${file}"
      }
    }
  }
}
]]

local function debuggers()
  vim.g.vimspector_install_gadgets = {
    "debugpy", -- Python
    "debugger-for-chrome",
    "vscode-node-debug2",
    "local-lua-debugger-vscode",
  }
end

function M.get_default_win_config()
  return {
    relative='win',
    width=120,
    height=20,
    border="single",
    win = 1001,
    row = 5,
    col = 15
  }
end

--- Generate debug profile. Currently for Python only
function M.generate_debug_profile()
  -- Get current file type
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")

  if ft == "python" then
    -- Get Python path
    local python3 = vim.fn.exepath "python"
    local debugProfile = string.format(vimspector_python, python3)

    -- Generate debug profile in a new window
    local bufNew = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_open_win(bufNew, true, M.get_default_win_config())
    vim.api.nvim_buf_set_name(bufNew, ".vimspector.json")
    vim.o.syntax = 'json'

    local lines = {}
    for s in debugProfile:gmatch "[^\r\n]+" do
      table.insert(lines, s)
    end
    vim.api.nvim_buf_set_lines(bufNew, 0, -1, false, lines)
  else
    utils.info("Unsupported language - " .. ft, "Generate Debug Profile")
  end
end

function M.toggle_human_mode()
  if vim.g.vimspector_enable_mappings == nil then
    vim.g.vimspector_enable_mappings = "HUMAN"
    utils.info("Enabled HUMAN mappings", "Debug")
  else
    vim.g.vimspector_enable_mappings = nil
    utils.info("Disabled HUMAN mappings", "Debug")
  end
end

function M.setup()
  vim.cmd [[packadd! vimspector]] -- Load vimspector
  debuggers() -- Configure debuggers
end

return M
