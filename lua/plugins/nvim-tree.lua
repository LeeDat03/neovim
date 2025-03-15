return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	event = "BufEnter",
	cmd = "NvimTreeToggle",
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
			disable_netrw = true,
			hijack_netrw = true,
		})

		vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { silent = true })
	end,
}
