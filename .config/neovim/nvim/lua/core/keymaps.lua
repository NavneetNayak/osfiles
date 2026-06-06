local opts = { silent = true }

vim.keymap.set({ "n", "v" }, ",", "<Nop>", { silent = true })


-- Disable arrow keys
vim.keymap.set("n", "<left>", "<nop>", opts)
vim.keymap.set("n", "<right>", "<nop>", opts)
vim.keymap.set("n", "<up>", "<nop>", opts)
vim.keymap.set("n", "<down>", "<nop>", opts)

-- Buffer movement
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", opts)
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", opts)
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", opts)
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", opts)

vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Move in insert mode
vim.keymap.set("i", "<C-h>", "<Left>", opts) 
vim.keymap.set("i", "<C-j>", "<Down>", opts)
vim.keymap.set("i", "<C-k>", "<Up>", opts)
vim.keymap.set("i", "<C-l>", "<Right>", opts)


-- Meta
local function Toggle_sign_column()
	local current_state = vim.opt.signcolumn:get()

	if current_state == "no" then
		vim.opt.signcolumn = "yes"
	elseif current_state == "yes" then
		vim.opt.signcolumn = "no"
	end
end

vim.keymap.set("n", "<leader>g", Toggle_sign_column, opts)


-- Save / Exit
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<ESC>:w<CR>", opts)
vim.keymap.set("n", "<C-q>", ":q<CR>", opts)
vim.keymap.set("i", "<C-q>", "<ESC>:q<CR>", opts)
vim.keymap.set("n", "<C-q><C-q>", ":qa!<CR>", opts)
vim.keymap.set("n", "<C-s><C-s>", ":wq<CR>", opts)

-- Escape insert mode
vim.keymap.set("i", "<C-c>", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- Resize
vim.keymap.set("n", "<Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<leader>v", "<C-w>v", opts)
vim.keymap.set("n", "<leader>h", "<C-w>s", opts)
vim.keymap.set("n", "<leader>se", "<C-w>=", opts)

-- Indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<C-a>", "ggVG", opts) -- select all
vim.keymap.set("v", "p", '"_dP', opts) -- paste without yanking
vim.keymap.set("n", "YY", "va{Vy", opts) -- yank block

-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set("n", "*", "*zzzv", opts)
vim.keymap.set("n", "#", "#zzzv", opts)

-- Start/End of line 
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Terminal
vim.keymap.set("n", "<leader>;", ":noh<CR>")
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=vertical<CR>")
vim.keymap.set("n", "<leader>t", ":ToggleTerm direction=horizontal<CR>")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], opts)
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)


-- Diagnostics 
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })


