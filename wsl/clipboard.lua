-- -- WSL-friendly clipboard for Neovim
-- local is_wsl = (vim.fn.has('wsl') == 1)
--
-- if is_wsl then
--   local win32yank = "win32yank.exe"
--   local clip = "/mnt/c/Windows/System32/clip.exe"
--   local pwsh = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
--
--   if vim.fn.executable(win32yank) == 1 then
--     -- Mais r├ípido/est├ível se voc├¬ tiver o win32yank
--     vim.g.clipboard = {
--       name = "win32yank-wsl",
--       copy = {["+"] = win32yank .. " -i --crlf", ["*"] = win32yank .. " -i --crlf"},
--       paste = {["+"] = win32yank .. " -o --lf",   ["*"] = win32yank .. " -o --lf"},
--       cache_enabled = 1,
--     }
--   elseif vim.fn.executable(clip) == 1 and vim.fn.executable(pwsh) == 1 then
--     -- Fallback usando clip.exe / PowerShell do Windows por caminho absoluto
--     vim.g.clipboard = {
--       name = "WslClipboard",
--       copy = {["+"] = clip, ["*"] = clip},
--       -- Remove \r que o PowerShell devolve
--       paste = {
--         ["+"] = pwsh .. " -NoProfile -Command Get-Clipboard | tr -d '\\r'",
--         ["*"] = pwsh .. " -NoProfile -Command Get-Clipboard | tr -d '\\r'",
--       },
--       cache_enabled = 1,
--     }
--   end
-- end
--
--
--
if vim.fn.has('wsl') == 1 and vim.fn.executable('win32yank.exe') == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf"},
    paste = {["+"] = "win32yank.exe -o --lf",  ["*"] = "win32yank.exe -o --lf"},
    cache_enabled = 1,
  }
end

