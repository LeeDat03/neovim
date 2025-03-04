return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"sainnhe/sonokai",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				relativenumber = true,
				width = 35,
			},
			filters = {
				dotfiles = true,
			},
		})
		vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { silent = true })
	end,
}
