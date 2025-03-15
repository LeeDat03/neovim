return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	},
	config = function()
		local comment = require("Comment")

		comment.setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			mappings = {
				basic = true, -- Enables gcc, gbc, gc, gb
				extra = true, -- Enables gcO, gco, gcA
			},
		})
		vim.keymap.set(
			"n",
			"<leader>cc",
			require("Comment.api").toggle.linewise.current,
			vim.tbl_extend("force", {}, { desc = "Toggle line comment" })
		)

		vim.keymap.set(
			"n",
			"<leader>cb",
			require("Comment.api").toggle.blockwise.current,
			vim.tbl_extend("force", {}, { desc = "Toggle block comment" })
		)
	end,
}
