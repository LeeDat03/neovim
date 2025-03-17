return {
	"echasnovski/mini.tabline",
	dependencies = { "echasnovski/mini.icons" },
	event = "UIEnter",
	opts = {
		tabpage_section = "right",
		show_icons = true, -- Enables file icons if mini.icons is installed
		format = function(buf_id, label)
			local suffix = ""

			if vim.bo[buf_id].modified then
				suffix = " ●"
			elseif vim.bo[buf_id].readonly then
				suffix = " 🔒"
			end

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
			return MiniTabline.default_format(buf_id, label) .. suffix
		end,
	},
}
