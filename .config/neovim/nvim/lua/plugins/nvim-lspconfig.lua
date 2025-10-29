return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},

		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local function lsp_setup(server_name, executable_name, setup_options)
				local exec = executable_name or server_name

				if vim.fn.executable(exec) == 1 then
					setup_options.capabilities = capabilities
					lspconfig[server_name].setup(setup_options)
				end
			end

			lsp_setup("lua_ls", "lua-language-server", {
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			lsp_setup("rust_analyzer", nil, {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = { command = "clippy" },
						cargo = { allFeatures = true },
					},
				},
			})

			lsp_setup("gopls", nil, {
				command = { "gopls" },
				rootPatterns = { "go.mod", ".vim/", ".git/", ".hg/" },
				filetypes = { "go" },
			})

			lsp_setup("clangd", nil, {})
			lsp_setup("nimls", nil, {})
			lsp_setup("ruff", nil, {})
			lsp_setup("pyright", nil, {})
			lsp_setup("ts_ls", "typescript-language-server", {})

			for _, group in ipairs({
				"DiagnosticVirtualTextError",
				"DiagnosticVirtualTextWarn",
				"DiagnosticVirtualTextInfo",
				"DiagnosticVirtualTextHint",
			}) do
				vim.api.nvim_set_hl(0, group, {})
			end

			local border = "rounded"
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = border,
			})
			vim.o.winblend = 30

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					vim.keymap.set("n", "gV", function()
						require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
					end, { desc = "[G]oto [D]efinition (Vertical Split)" })

					--  To jump back, press <C-T>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					-- Fuzzy find all the symbols in your current workspace
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					map("K", vim.lsp.buf.hover, "Hover Documentation")

					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
					map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
					map("<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "[W]orkspace [L]ist Folders")
				end,
			})

			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
				}),
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Tab>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
			})
		end,
	},
}
