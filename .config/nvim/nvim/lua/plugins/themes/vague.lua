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
    bg           = "#101010",
    fg           = "#e2d8cc",  -- was #cdcdcd, slightly warmer & brighter
    floatBorder  = "#878787",
    line         = "#252530",
    comment      = "#7c7264",  -- was #7c6f64, barely touched
    builtin      = "#ddd0a8",  -- was #d5c4a1, lifted for contrast vs fg
    func         = "#d08b8b",  -- was #c48282, more pop
    string       = "#f0c090",  -- was #e8b589, clearly bright/warm
    number       = "#f0a855",  -- was #e0a363, warmer orange
    property     = "#c8c0a8",  -- was #c3b99c, kept subtle
constant = "#d4bc94",  -- was #e0c87c (gold), warm sand — earthy but not yellow
    parameter    = "#c4aa7a",  -- was #b89b72, slightly up
    visual       = "#333738",
    error        = "#d8647e",
    warning      = "#f3be7c",
    hint         = "#bdae93",
    operator     = "#b8a090",  -- was #b19c7d, desaturated slightly
    keyword      = "#c4956a",  -- was #a38a67, stronger amber
    type         = "#b8c4a0",  -- was #a89c87, cool sage green (distinct from property)
    search       = "#665c54",
    plus         = "#7fa563",
    delta        = "#f3be7c",
},
		})

		vim.cmd.colorscheme("vague")

    vim.api.nvim_set_hl(0, "Visual", { reverse = true })
  end,
}
