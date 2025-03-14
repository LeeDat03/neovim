return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				show_source = true,
				multilines = {
					enabled = true, -- Enable multiline diagnostics
					always_show = true, -- Always show diagnostics on all lines
				},
				show_all_diags_on_cursorline = true, -- Show all diagnostics on the cursor line
				break_line = {
					enabled = true,
					after = 80, -- Break lines after 80 characters
				},
			},
		})

		-- Ensure Neovim displays diagnostics globally
		vim.diagnostic.config({
			virtual_text = true, -- Show inline diagnostics everywhere
			signs = true, -- Enable signs in the gutter
			underline = true, -- Underline errors/warnings
			update_in_insert = false, -- Do not update while typing in insert mode
		})
	end,
}
