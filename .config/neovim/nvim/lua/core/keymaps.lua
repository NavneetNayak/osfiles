vim.keymap.set({ "n", "v" }, ",", "<Nop>", { silent = true })

-- Disable arrow keys
vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")

-- Buffer movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go Left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go Up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go Right" })

-- Move in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Meta
local function Toggle_sign_column()
  local current_state = vim.opt.signcolumn:get()

  if current_state == "no" then
    vim.opt.signcolumn = "yes"
  elseif current_state == "yes" then
    vim.opt.signcolumn = "no"
  end
end

vim.keymap.set("n", "<leader>g", Toggle_sign_column, { desc = "Toggle signcolumn" })

-- Save / Exit
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
vim.keymap.set({ "i", "x" }, "<C-s>", "<Esc><cmd>w<cr>", { desc = "Save File" })

vim.keymap.set("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit Buffer" })
vim.keymap.set({ "i", "x" }, "<C-q>", "<ESC><cmd>q<cr>", { desc = "Quit Buffer" })

vim.keymap.set("n", "<leader><leader>q", "<cmd>qa!<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader><leader>s", "<cmd>wq<cr>", { desc = "Save and Quit All" })

-- Escape insert mode
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")

-- Resize
vim.keymap.set("n", "<Up>", ":resize +2<CR>")
vim.keymap.set("n", "<Down>", ":resize -2<CR>")
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>")

-- Buffers
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>h", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")

-- Indentation
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-a>", "ggVG") -- select all
vim.keymap.set("v", "p", '"_dP') -- paste without yanking
vim.keymap.set("n", "YY", "va{Vy") -- yank block

-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")

-- Start/End of line
vim.keymap.set({ "n", "x", "o" }, "H", "^")
vim.keymap.set({ "n", "x", "o" }, "L", "g_")

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Terminal
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "jk", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]])
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]])

-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
