local opts = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.keymap.set({ "n", "v" }, ",", "<Nop>", { silent = true })

local function Toggle_sign_column()
	local current_state = vim.opt.signcolumn:get()

	if current_state == "no" then
		vim.opt.signcolumn = "yes"
	elseif current_state == "yes" then
		vim.opt.signcolumn = "no"
	end
end

vim.keymap.set("n", "<left>", "<nop>", opts)
vim.keymap.set("n", "<right>", "<nop>", opts)
vim.keymap.set("n", "<up>", "<nop>", opts)
vim.keymap.set("n", "<down>", "<nop>", opts)

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", opts)
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", opts)
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", opts)
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", opts)

vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>", opts)
vim.keymap.set("n", "<C-q>", ":q<CR>", opts)
vim.keymap.set("n", "<C-q><C-q>", ":qa!<CR>", opts)
vim.keymap.set("n", "<C-s><C-s>", ":wq<CR>", opts)

vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "<leader>v", "<C-w>v", opts)
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<leader>g", Toggle_sign_column, opts)

vim.keymap.set("n", "<leader>;", ":noh<CR>")
vim.keymap.set("n", "<leader>t", ":ToggleTerm direction=vertical<CR>")
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=horizontal<CR>")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
