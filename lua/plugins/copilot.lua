return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		keys = {
			"<leader>ct",
		},
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true, -- Only suggest when a key is pressed
					keymap = {
						accept = "<C-y>",
						next = "<C-t>",
						prev = "<C-u>",
						dismiss = "<C-]>",
					},
				},
			})

			if _G.copilot_enabled == nil then
				_G.copilot_enabled = true
			end

			vim.keymap.set("n", "<leader>ct", function()
				_G.copilot_enabled = not _G.copilot_enabled -- Toggle the state
				require("copilot.suggestion").toggle_auto_trigger()
				vim.notify(
					"Copilot Suggestion Toggled: " .. (_G.copilot_enabled and "ON" or "OFF"),
					vim.log.levels.INFO
				)
				vim.cmd("redrawstatus") -- Force statusline to update
			end, { desc = "Toggle Copilot Suggestion" })
		end,
	},
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	dependencies = { "zbirenbaum/copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },
}
