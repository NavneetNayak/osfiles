require("core.options")
require("core.keymaps")

Theme = "plugins.themes."
DefaultTheme = "vague"
local nvim_theme = os.getenv("NVIM_THEME")

if nvim_theme == nil then
	Theme = Theme .. DefaultTheme
else
	Theme = Theme .. nvim_theme
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require(Theme),
	require("plugins.lualine"),
	require("plugins.neotree"),
	require("plugins.misc"),
	require("plugins.telescope"),
	require("plugins.toggleterm"),
	require("plugins.gitsigns"),
	require("plugins.nvim-lspconfig"),
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
		vim.cmd("set signcolumn=no")
	end,
})

vim.opt.termguicolors = true
