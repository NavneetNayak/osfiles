local defaultTheme = "gruvbox-material"
local envTheme = os.getenv("NVIM_THEME")

local theme = envTheme

if not theme or theme == "" then
  theme = defaultTheme
end

local ok, err = pcall(vim.cmd.colorscheme, theme)

if not ok then
  vim.notify("Failed to load theme.", vim.log.levels.ERROR)

  vim.cmd.colorscheme(defaultTheme)
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("MuteDiagnostics", { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "Comment" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "Comment" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "Comment" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "Comment" })
  end,
})
