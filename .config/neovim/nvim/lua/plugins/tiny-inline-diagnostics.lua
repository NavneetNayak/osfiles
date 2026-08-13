return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,

    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "powerline",
        transparent_bg = true,

        options = {
          show_cursorline = false,
          throttle = 20,
          show_source = {
            enabled = true,
            if_manu = true,
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = false,
        underline = false,
        signs = false,
      })
    end,
  },
}
