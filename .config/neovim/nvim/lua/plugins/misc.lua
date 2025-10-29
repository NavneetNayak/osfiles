return {
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
				smart_indent_cap = true,
			},
			scope = {
				show_exact_scope = true,
			},
		},
	},
  {
    "smjonas/inc-rename.nvim",
    event = "LspAttach",
    config = true,
  },
}
