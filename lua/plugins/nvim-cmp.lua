return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp", lazy = true }, -- LSP source for nvim-cmp
		{ "hrsh7th/cmp-buffer", lazy = true }, -- Buffer source for nvim-cmp
		{ "hrsh7th/cmp-path", lazy = true }, -- Path source for nvim-cmp
		{ "zbirenbaum/copilot-cmp" },
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			completion = { completeopt = "menu,menuone,preview,noselect" }, -- Completion options
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(), -- Navigate to next item
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Navigate to previous item
				["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
				["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation down
				["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion manually
				["<C-e>"] = cmp.mapping.abort(), -- Abort completion
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP completions
				{ name = "copilot" }, -- Copilot completions
				-- { name = "luasnip" }, -- Snippet completions
				{ name = "buffer" }, -- Buffer completions
				{ name = "path" }, -- Path completions
			}),
			-- experimental = { ghost_text = true }, -- Enable ghost text
		})
	end,
}
