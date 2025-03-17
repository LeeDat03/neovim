return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.icons",
		},
		event = { "BufReadPre *.md", "BufWinEnter *.md" }, -- Load only when a Markdown file is opened
		config = function()
			require("render-markdown").setup({
				syntax_highlighting = true,
				conceal = true,
				markdown_folding = true,
			})
		end,
	},
}
