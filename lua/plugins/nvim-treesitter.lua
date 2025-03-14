return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
					"java",
					"html",
					"css",
					"json",
					"prisma",
					"toml",
					"tsx",
					"graphql",
					"gitignore",
					"dockerfile",
				},
				auto_install = true,
				sync_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-n>",
						node_incremental = "<C-n>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})

			require("nvim-treesitter.install").compilers = { "zig" }
		end,
	},
}
