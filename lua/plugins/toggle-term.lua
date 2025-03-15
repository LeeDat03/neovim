return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			winbar = {
				enabled = false,
			},
		})
	end,
}
