vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Make start page blank buffer
vim.opt.shortmess:append("I")

vim.g.loaded_netrw = 1 -- Disable netrw file explorer 
vim.g.loaded_netrwPlugin = 1 -- Disable netrw plugin component

vim.opt.mouse = "a"                                 
vim.opt.clipboard = "unnamedplus"                   
vim.opt.undofile = true                             
vim.opt.updatetime = 100                            
vim.opt.confirm = true -- Prompt for confirmation instead of failing on unsaved changes
vim.opt.autoread = true -- Automatically reload files changed outside of Neovim

vim.opt.termguicolors = true      
vim.opt.number = true             
vim.opt.relativenumber = true     
vim.opt.signcolumn = "yes:1"      
vim.opt.cursorline = false        
vim.opt.wrap = false              
vim.opt.breakindent = true        
vim.opt.showmode = false          
vim.opt.showcmd = false           
vim.opt.ruler = true              
vim.opt.showtabline = 0           
vim.opt.cmdheight = 0
vim.opt.pumheight = 10            
vim.o.winborder = "solid"

vim.opt.hlsearch = true   -- Highlight all search matches
vim.opt.incsearch = true  -- Show search matches as you type
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.breakindent = true

vim.opt.scrolloff = 10
vim.opt.numberwidth = 1

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.fileencoding = "utf-8" 
vim.opt.backup = false        
vim.opt.writebackup = false  
vim.opt.swapfile = false   

vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Completion menu options
vim.opt.conceallevel = 0   

vim.opt.title = true  
