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
M.mappings = require "custom.keymap"

return M
