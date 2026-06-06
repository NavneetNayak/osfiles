return {
	"vague2k/vague.nvim",
	name = "vague",

	lazy = false,
	priority = 1000,

	black = "#101010",

	config = function()
		require("vague").setup({
			colors = {
				bg = black,
				fg = "#e2d8cc",
				floatBorder = "#878787",
				line = "#252530",
				comment = "#7c7264",
				builtin = "#ddd0a8",
				func = "#d08b8b",
				string = "#f0c090",
				number = "#f0a855",
				property = "#c8c0a8",
				constant = "#d4bc94",
				parameter = "#c4aa7a",
				visual = "#333738",
				error = "#d8647e",
				warning = "#f3be7c",
				hint = "#bdae93",
				operator = "#b8a090",
				keyword = "#c4956a",
				type = "#b8c4a0",
				search = "#665c54",
				plus = "#7fa563",
				delta = "#f3be7c",
			},
		})

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "vague",
			callback = function()
				vim.api.nvim_set_hl(0, "Visual", { reverse = true })
				vim.api.nvim_set_hl(0, "Normal", { bg = black })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = black })
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
