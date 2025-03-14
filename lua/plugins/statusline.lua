return {
	"echasnovski/mini.statusline",
	version = "*",
	config = function()
		local MiniStatusline = require("mini.statusline")

		_G.copilot_enabled = false -- Global variable to track Copilot state

		local function copilot_status()
			if _G.copilot_enabled then
				return " "
			else
				return " "
			end
		end

		local function custom_section_location()
			return "%2l│%-2v" -- Always show "line│column"
		end

		MiniStatusline.setup({
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local location = custom_section_location()
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
					local copilot = copilot_status()

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						{ hl = "MiniStatuslineFileinfo", strings = { copilot, fileinfo } },
						{ hl = mode_hl, strings = { search, location } },
					})
				end,
			},
		})
	end,
}
