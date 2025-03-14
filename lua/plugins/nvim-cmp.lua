return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		-- "zbirenbaum/copilot-cmp",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = { completeopt = "menu,menuone,preview,noselect" },
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- Manually trigger completion
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", group_index = 1 }, -- LSP results come first
				-- { name = "copilot", group_index = 2 }, -- Copilot results come after LSP
				{ name = "luasnip", group_index = 2 }, -- Snippets are grouped with Copilot
				{ name = "buffer", group_index = 3 }, -- Buffer completion appears after Copilot
				{ name = "path", group_index = 3 }, -- Path completion appears last
			}),
			experimental = { ghost_text = true },
		})
	end,
}
