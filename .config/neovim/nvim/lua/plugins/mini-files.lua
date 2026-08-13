return {
  "echasnovski/mini.files",
  version = false,
  config = function()
    require("mini.files").setup({
      windows = {
        preview = false,
        width_focus = 30,
        width_nofocus = 25,
      },

      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "L",
        go_out = "h",
        go_out_plus = "H",
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "t",
        trim_left = "<",
        trim_right = ">",
      },
    })

    vim.keymap.set("n", "<leader>e", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end, { desc = "Open Mini Files" })
  end,
}
