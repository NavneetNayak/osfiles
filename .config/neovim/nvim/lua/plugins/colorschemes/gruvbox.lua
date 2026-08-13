return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_enable_italic = false
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "material"

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "gruvbox-material",
      callback = function()
        local black = "NONE"

        vim.api.nvim_set_hl(0, "Normal", { bg = black })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = black })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = black })
        vim.api.nvim_set_hl(0, "Visual", { reverse = true })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = black })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = black })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = black })
      end,
    })
  end,
}
