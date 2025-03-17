return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = true,
	keys = { "<c-\\>", "<C-t>" },
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]],
			direction = "tab",
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
		})
	end,
}
