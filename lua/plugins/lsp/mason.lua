return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", lazy = true },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", lazy = true },
	},
	event = "VeryLazy",
	cmd = "Mason",

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				-- "html",
				-- "ts_ls",
				-- "cssls",
				-- "tailwindcss",
				-- "lua_ls",
				-- "graphql",
				-- "prismals",
				-- "jdtls",
				-- "clangd",
				-- "gopls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "prettier", -- prettier formatter
				-- "stylua", -- lua formatter
				-- "black", -- python formatter
				-- "eslint_d",
			},
			-- automatic_installation = true,
		})
	end,
}
