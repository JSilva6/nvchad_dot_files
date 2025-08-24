require "nvchad.options"

local opt = vim.opt

opt.relativenumber = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.cindent = true
opt.expandtab = true
opt.foldenable = false
opt.foldmethod = "indent"
opt.exrc = true

require "wsl.clipboard"

vim.g["python_host_prog"] = "/usr/bin/python2"
vim.g["python3_host_prog"] = "/usr/bin/python3"

-- assembly extensions ._.
-- vim.filetype.add({
--   extension = { asm = "asm", s = "asm", S = "asm" },
-- })
--
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.asm", "*.s", "*.S" },
--   callback = function(args)
--     if vim.bo[args.buf].filetype == "" then
--       vim.bo[args.buf].filetype = "asm"
--     end
--   end,
-- })
