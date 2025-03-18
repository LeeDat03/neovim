return {
	"sindrets/diffview.nvim",
	dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
	cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	config = function()
		require("diffview").setup()

		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true, desc = "" }

		-- Keymaps with descriptions
		keymap(
			"n",
			"<leader>do",
			":DiffviewOpen<CR>",
			vim.tbl_extend("force", opts, { desc = "Open Diffview to review changes" })
		)
		keymap("n", "<leader>dc", ":DiffviewClose<CR>", vim.tbl_extend("force", opts, { desc = "Close Diffview" }))
		keymap("n", "<leader>dr", ":DiffviewRefresh<CR>", vim.tbl_extend("force", opts, { desc = "Refresh Diffview" }))
		keymap(
			"n",
			"<leader>dh",
			":DiffviewFileHistory<CR>",
			vim.tbl_extend("force", opts, { desc = "Open Git file history" })
		)
		keymap(
			"n",
			"<leader>dhf",
			":DiffviewFileHistory %<CR>",
			vim.tbl_extend("force", opts, { desc = "Open Git file history for current file" })
		)
	end,
}
