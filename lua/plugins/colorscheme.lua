return {
	{
		"sainnhe/sonokai",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.sonokai_cursor = "red"
			vim.g.sonokai_enable_italic = false
			vim.cmd.colorscheme("sonokai")
		end,
	},
}
