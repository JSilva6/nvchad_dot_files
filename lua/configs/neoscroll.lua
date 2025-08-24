local present, neoscroll = pcall(require, "neoscroll")

if not present then
   return
end

local options = {
    mappings = {},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "circular",       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
}

local mappings = {
  ['<S-Up>'] = function() neoscroll.scroll(-0.95, {move_cursor=false; duration=250}) end,
  ['<S-Down>'] = function() neoscroll.scroll(0.95, {move_cursor=false; duration=250}) end,
  ['<C-U>'] = function() neoscroll.scroll(-0.5, {move_cursor=false; duration=100}) end,
  ['<C-D>'] = function() neoscroll.scroll(0.5, {move_cursor=false; duration=100}) end,
  ['z.'] = function() neoscroll.zz({half_win_duration=250}) end,
  ['zz'] = function() neoscroll.zz({half_win_duration=250}) end
}

neoscroll.setup(options)

local modes = { 'n', 'v', 'x' }
for key, func in pairs(mappings) do
  vim.keymap.set(modes, key, func)
end
