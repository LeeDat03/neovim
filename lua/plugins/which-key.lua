return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>a", group = "ai" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>s", group = "Split" },
			{ "<leader>d", group = "Diffview" },
			{ "<leader>g", group = "Gitsigns" },
		},
	},
}
