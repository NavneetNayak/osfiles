return {
	"akinsho/toggleterm.nvim",
	name = "toggleterm",

	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,

			hide_numbers = true,
			shade_filetypes = {},
			autochdir = true,
			shade_terminals = false,
			start_in_insert = true,
			persist_size = true,
			persist_mode = true,

			direction = "vertical",

			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,

			winbar = {
				enabled = false,
				name_formatter = function(term)
					return term.name
				end,
			},
			responsiveness = {
				horizontal_breakpoint = 135,
			},
		})
	end,
}
