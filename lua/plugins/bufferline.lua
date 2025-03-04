return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				mode = "buffers",
				buffer_close_icon = "󰅖",
				modified_icon = "● ",
				close_icon = " ",
				left_trunc_marker = " ",
				right_trunc_marker = " ",
				style_preset = {
					bufferline.style_preset.no_italic,
				},
			},
		})

		vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { silent = true })
	end,
}
