return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,

  config = function()
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.gruvbox_transparent_bg = "0"
    vim.g.gruvbox_bold = 1
    vim.g.gruvbox_underline = true
    vim.g.gruvbox_undercurl = true
    vim.g.gruvbox_italicize_comments = "1"
    vim.g.gruvbox_italicize_strings = true
    vim.g.gruvbox_invert_selection = false
    vim.g.gruvbox_invert_tabline = true
    vim.g.gruvbox_hls_cursor = "orange"
    vim.g.gruvbox_invert_signs = true
    vim.g.gruvbox_vert_split = "green"
    vim.g.gruvbox_color_column = "bg0"
    vim.g.gruvbox_sign_column = "bg0"

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "gruvbox",
      callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = black })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = black })
        vim.api.nvim_set_hl(0, "Visual", { reverse = true })
        vim.api.nvim_set_hl(0, "FloatBorder", {
          bg = black,
        })

        vim.api.nvim_set_hl(0, "FloatTitle", {
          bg = black,
        })

        vim.api.nvim_set_hl(0, "Pmenu", {
          bg = black,
        })
      end,
    })
  end,
}
