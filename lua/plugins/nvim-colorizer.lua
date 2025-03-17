return {
	"norcalli/nvim-colorizer.lua",
	event = "BufReadPost",
	lazy = true,
	config = function()
		require("colorizer").setup()
	end,
}
