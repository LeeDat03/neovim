return {
	{
		"neovim/nvim-lspconfig",
		event = { "LspAttach" },
		dependencies = {
			{
				"hrsh7th/cmp-nvim-lsp",
				lazy = true,
			},
			-- {
			-- 	"Hoffs/omnisharp-extended-lsp.nvim",
			-- 	lazy = true,
			-- },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			local on_attach = function(client, _)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false

				-- LSP Mappings
				local lsp_mappings = {
					{ "<leader>gd", "vim.lsp.buf.definition()" },
					{ "<leader>k", "vim.lsp.buf.hover()" },
					{ "<leader>rn", "vim.lsp.buf.rename()" },
					{ "<leader>gr", "vim.lsp.buf.references()" },
					{ "<leader>gt", "vim.lsp.buf.type_definition()" },
					{ "<leader>sh", "vim.lsp.buf.signature_help()" },
					{ "<leader>ca", "vim.lsp.buf.code_action()" },
				}

				for _, mapping in ipairs(lsp_mappings) do
					vim.keymap.set(
						"n",
						mapping[1],
						"<Cmd>lua " .. mapping[2] .. "<CR>",
						{ noremap = true, silent = true }
					)
				end

				vim.api.nvim_set_keymap(
					"n",
					"<Leader>d",
					":lua vim.diagnostic.open_float()<CR>",
					{ noremap = true, silent = true }
				)

				-- print("LSP server '" .. client.name .. "' started successfully!")
			end

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkthirdparty = false,
							},
							telemetry = { enable = false },
						},
					},
				},
				ts_ls = {
					init_options = {
						maxTsServerMemory = 3072,
						single_file_support = true,
					},
				},
				gopls = {
					settings = {
						gopls = { staticcheck = true },
					},
				},
				svelte = {
					cmd = { "svelteserver", "--stdio" },
					filetypes = { "svelte" },
				},
				html = {
					filetypes = {
						"html",
						"css",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"vue",
						"svelte",
					},
				},
				cssls = {
					filetypes = { "css", "scss", "less", "svelte" },
				},
				tailwindcss = {
					filetypes = {
						"html",
						"css",
						"javascript",
						"typescript",
						"javascriptreact",
						"typescriptreact",
						"vue",
						"svelte",
					},
				},

				jdtls = {
					root_dir = lspconfig.util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
				},

				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--completion-style=detailed",
						"--header-insertion=never",
					},
					init_options = {
						clangdFileStatus = true,
					},
					settings = {
						clangd = {
							checkUpdates = true,
							fallbackFlags = { "-std=c++20" },
						},
					},
				},
			}
			for server, config in pairs(servers) do
				config.on_attach = on_attach
				config.capabilities = capabilities
				lspconfig[server].setup(config)
			end
		end,
	},
}
