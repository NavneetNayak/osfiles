local defaultTheme = "vague"
local envTheme = os.getenv("NVIM_THEME")

local theme = envTheme

if not theme or theme == "" then
  theme = defaultTheme
end

local ok, err = pcall(vim.cmd.colorscheme, theme)

if not ok then
  vim.notify(
    "Failed to load theme.",
    vim.log.levels.ERROR
  )

  vim.cmd.colorscheme(defaultTheme)
end
