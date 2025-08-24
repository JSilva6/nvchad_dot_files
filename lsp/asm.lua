-- dentro do seu custom.lsp.asm
vim.filetype.add({
  extension = { asm = "asm", s = "asm", S = "asm" },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.asm", "*.s", "*.S" },
  callback = function(args)
    if vim.bo[args.buf].filetype == "" then
      vim.bo[args.buf].filetype = "asm"
    end
  end,
})
