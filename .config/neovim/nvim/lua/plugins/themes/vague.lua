return {
	"vague2k/vague.nvim",
	name = "vague",

	lazy = false,
	priority = 1000,

	config = function()
		require("vague").setup({
			transparent = false,
			bold = true,
			italic = false,
			style = {
				boolean = "bold",
				number = "none",
				float = "none",
				error = "bold",
				comments = "none",
				conditionals = "none",
				functions = "none",
				headings = "bold",
				operators = "none",
				strings = "none",
				variables = "none",

				keywords = "none",
				keyword_return = "none",
				keywords_loop = "none",
				keywords_label = "none",
				keywords_exception = "none",

				builtin_constants = "bold",
				builtin_functions = "none",
				builtin_types = "bold",
				builtin_variables = "none",
			},
			plugins = {
				cmp = {
					match = "bold",
					match_fuzzy = "bold",
				},
				dashboard = {
					footer = "italic",
				},
				lsp = {
					diagnostic_error = "bold",
					diagnostic_hint = "none",
					diagnostic_info = "none",
					diagnostic_ok = "none",
					diagnostic_warn = "bold",
				},
				neotest = {
					focused = "bold",
					adapter_name = "bold",
				},
				telescope = {
					match = "bold",
				},
			},

			colors = {
				bg = "#101010",
				fg = "#cdcdcd",
				floatBorder = "#878787",
				line = "#252530",
				comment = "#7c6f64",
				builtin = "#d5c4a1",
				func = "#c48282",
				string = "#e8b589",
				number = "#e0a363",
				property = "#c3b99c",
				constant = "#bdae93",
				parameter = "#b89b72",
				visual = "#333738",
				error = "#d8647e",
				warning = "#f3be7c",
				hint = "#bdae93",
				operator = "#b19c7d",
				keyword = "#a38a67",
				type = "#a89c87",
				search = "#665c54",
				plus = "#7fa563",
				delta = "#f3be7c",
			},
		})

		vim.cmd.colorscheme("vague")

    vim.api.nvim_set_hl(0, "Visual", { reverse = true })
  end,
}
