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
  ['<S-Up>'] = {'scroll', {'-0.95', 'false', '250'}},
  ['<S-Down>'] = {'scroll', {'0.95', 'false', '250'}},
  ['<C-U>'] = {'scroll', {'-0.5', 'false', '100'}},
  ['<C-D>'] = {'scroll', {'0.5', 'false', '100'}},
  ['z.'] = {'zz', {'250'}},
  ['zz'] = {'zz', {'250'}}
}

neoscroll.setup(options)
require('neoscroll.config').set_mappings(mappings)
