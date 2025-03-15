return {
	"echasnovski/mini.icons",
	lazy = true, 
	priority = 100,
	version = "*",
	config = function()
		require("mini.icons").setup({
			style = "glyph", -- Choose between 'glyph' or 'ascii'

			-- Custom icons per category
			default = {},
			directory = {},
			extension = {},
			file = {},
			filetype = {},
			lsp = {},
			os = {},

			-- Determine if file extensions should be considered
			use_file_extension = function(ext, file)
				return true
			end,
		})

		-- Disable `nvim-web-devicons` globally to avoid conflicts
		package.loaded["nvim-web-devicons"] = nil
		vim.g.loaded_nvim_web_devicons = 1

		-- Mock `nvim-web-devicons` using MiniIcons
		package.preload["nvim-web-devicons"] = function()
			return require("mini.icons").mock_nvim_web_devicons()
		end
	end,
}
