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

		vim.keymap.set("n", "<leader>bd", function()
			local bufnr = vim.api.nvim_get_current_buf() -- Get current buffer ID
			local other_buf = vim.fn.bufnr("#") -- Get alternate buffer

			-- Check if an alternate buffer exists and is valid
			if other_buf > 0 and vim.api.nvim_buf_is_valid(other_buf) then
				vim.api.nvim_set_current_buf(other_buf) -- Switch to alternate buffer
			end

			-- Delete the current buffer
			vim.cmd("bd " .. bufnr)
		end, { silent = true })
	end,
}
