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

				-- Define options
				local opts = { noremap = true, silent = true, buffer = bufnr, desc = "" }

				-- Navigation
				vim.keymap.set(
					"n",
					"<leader>nh",
					gs.next_hunk,
					vim.tbl_extend("force", opts, { desc = "Jump to next hunk" })
				)
				vim.keymap.set(
					"n",
					"<leader>ph",
					gs.prev_hunk,
					vim.tbl_extend("force", opts, { desc = "Jump to previous hunk" })
				)

				-- Actions
				vim.keymap.set("n", "<leader>gs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
				vim.keymap.set("n", "<leader>gr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
				vim.keymap.set("v", "<leader>gs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, vim.tbl_extend("force", opts, { desc = "Stage selected hunks" }))
				vim.keymap.set("v", "<leader>gr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, vim.tbl_extend("force", opts, { desc = "Reset selected hunks" }))
				vim.keymap.set(
					"n",
					"<leader>gS",
					gs.stage_buffer,
					vim.tbl_extend("force", opts, { desc = "Stage entire buffer" })
				)
				vim.keymap.set(
					"n",
					"<leader>gu",
					gs.undo_stage_hunk,
					vim.tbl_extend("force", opts, { desc = "Undo last staged hunk" })
				)
				vim.keymap.set(
					"n",
					"<leader>gR",
					gs.reset_buffer,
					vim.tbl_extend("force", opts, { desc = "Reset entire buffer" })
				)

				-- Blame
				vim.keymap.set(
					"n",
					"<leader>gb",
					gs.toggle_current_line_blame,
					vim.tbl_extend("force", opts, { desc = "Toggle current line blame" })
				)
				vim.keymap.set(
					"n",
					"<leader>gd",
					gs.diffthis,
					vim.tbl_extend("force", opts, { desc = "View diff against index" })
				)
				vim.keymap.set("n", "<leader>gD", function()
					gs.diffthis("~")
				end, vim.tbl_extend("force", opts, { desc = "View diff against previous commit" }))

				-- Toggle signs and blame
				vim.keymap.set(
					"n",
					"<leader>gt",
					gs.toggle_signs,
					vim.tbl_extend("force", opts, { desc = "Toggle Git signs" })
				)
				vim.keymap.set(
					"n",
					"<leader>gl",
					gs.toggle_linehl,
					vim.tbl_extend("force", opts, { desc = "Toggle line highlights" })
				)
				vim.keymap.set(
					"n",
					"<leader>gn",
					gs.toggle_numhl,
					vim.tbl_extend("force", opts, { desc = "Toggle number highlights" })
				)
			end,
		})
	end,
}
