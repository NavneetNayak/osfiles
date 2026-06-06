return  {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    local parsers = {
      "bash", "c", "css", "go", "gomod", "gosum", "gowork",
      "html", "javascript", "json", "latex", "lua", "luadoc", "luap",
      "markdown", "markdown_inline", "php", "proto", "python", "query",
      "regex", "rust", "scss", "svelte", "swift", "terraform",
      "tsx", "typescript", "vim", "vimdoc", "vue", "yaml", "zig",
    }
    require("nvim-treesitter").install(parsers)

    -- Enable treesitter-based highlighting and indentation per-buffer
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
