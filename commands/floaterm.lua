local bufgather = vim.fn['floaterm#buflist#gather']
local bufinfo = vim.fn['getbufinfo']
local unkillable_name = 'unkillable'
local latest_args = ""

local function toggle_floaterm(name, only_open)
  only_open = only_open or false

  local open_bufs = {}
  local target_is_open = false
  local target_was_found = false

  for _, buffnr in ipairs(bufgather()) do
    local bufferinfo = bufinfo(buffnr)[1]
    local bufname = bufferinfo.variables.floaterm_name

    if bufname == name then
      target_was_found = true
    end

    local bufhidden = bufferinfo.hidden

    if bufhidden == 0 then
      if bufname ~= unkillable_name then
        table.insert(open_bufs, bufname)
        if bufname == name then
          target_is_open = true
        end
      else
        vim.cmd('FloatermShow ' .. unkillable_name)
      end
    end
  end

  if target_is_open then
    if not only_open then
      vim.cmd('FloatermHide ' .. name)
    else
      vim.cmd('FloatermShow ' .. name)
    end
    return true
  end

  if #open_bufs > 0 and not only_open then
    for _, bufname in ipairs(open_bufs) do
      vim.cmd('FloatermHide ' .. bufname)
    end
    return true
  end

  if target_was_found and not target_is_open then
    vim.cmd('FloatermShow ' .. name)
    return true
  end

  return false
end

local function open_floating_terminal(args, width, height, position, name)
  local cmd = args.args or args or ""
  width = width or 0.5
  height = height or 0.35
  position = position or 'bottomright'
  name = name or "default"

  if cmd ~= "" then
    name = unkillable_name
    position = 'topright'
  end

  if name ~= unkillable_name and toggle_floaterm(name, true) then return end

  local command = 'FloatermNew --name=' .. name .. ' --position=' .. position .. ' --width=' .. width .. ' --height=' .. height .. ' --autoclose=0'
  if cmd ~= "" then
    command = command .. " " .. cmd
  end

  vim.cmd(command)
end

local function toggle_floating_terminal(args)
  local name = args[1] or "default"

  toggle_floaterm(name)
end

local function open_terminal(args)
  if args.args and args.args ~= "" then
    latest_args = args.args
  end
  open_floating_terminal(args, false)
end

local function reset_terminal()
  if latest_args ~= "" then
    vim.cmd('FloatermKill ' .. unkillable_name)
    open_floating_terminal({args = latest_args}, false)
  else
    print("No previous terminal command found.")
  end
end

vim.api.nvim_create_user_command('GitTerminal', function()
  open_floating_terminal("gitui", 0.8, 0.8, 'topright', "git")
end, { nargs = '*' })

vim.api.nvim_create_user_command('Terminal', function(args)
  open_terminal(args)
end, { nargs = '*' })

vim.api.nvim_create_user_command('TerminalToggle', function(args)
  toggle_floating_terminal(args)
end, {})

vim.api.nvim_create_user_command('TerminalReset', function()
  reset_terminal()
end, {})

