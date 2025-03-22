return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.cmd("highlight GitSignsCurrentLineBlame guifg=#EBCB8B")

		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged_enable = true,
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = {
				follow_files = true,
			},
			auto_attach = true,
			attach_to_untracked = false,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 1000,
				ignore_whitespace = false,
				virt_text_priority = 100,
				use_focus = true,
			},
			current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000, -- Disable if file is longer than this (in lines)
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- Key mappings
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				-- Helper function to define keymaps with descriptions
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = bufnr, -- Make keymap buffer-local
						noremap = true, -- No recursive mapping
						silent = true, -- No command echo
						desc = desc, -- Description for keymap
					})
				end

				-- Keybindings for Gitsigns with descriptions
				map("n", "<Leader>rh", gs.reset_hunk, "Reset current hunk")
				map("n", "<Leader>rb", gs.reset_buffer, "Reset entire buffer")
				map("n", "<Leader>ph", gs.preview_hunk, "Preview current hunk")
				map("n", "<Leader>df", gs.diffthis, "Show diff of current file")
				map("n", "<Leader>bl", gs.toggle_current_line_blame, "Toggle line blame")
				map("n", "<Leader>gs", gs.toggle_signs, "Toggle git signs")
				map("n", "<Leader>nh", gs.next_hunk, "Jump to next hunk")
				map("n", "<Leader>ph", gs.prev_hunk, "Jump to previous hunk")
			end,
		})
	end,
}
