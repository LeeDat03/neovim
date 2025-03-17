return {
	"echasnovski/mini.icons",
	event = "VimEnter",
	priority = 100,
	version = "*",
	config = function()
		local icons = require("mini.icons")

		icons.setup({
			style = "glyph", -- Options: 'glyph' | 'ascii'
			use_file_extension = function(_, _)
				return true
			end, -- Always use file extension
		})

		-- Disable `nvim-web-devicons` to prevent conflicts
		vim.g.loaded_nvim_web_devicons = 1
		package.loaded["nvim-web-devicons"] = nil
		package.preload["nvim-web-devicons"] = function()
			return icons.mock_nvim_web_devicons()
		end
	end,
}
