return {
	{
		"mfussenegger/nvim-jdtls",
		ft = { "java" }, -- Load only for Java files
		config = function()
			local jdtls = require("jdtls")
			local home = vim.fn.expand("$HOME")
			local workspace_dir = home .. "/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

			local config = {
				cmd = {
					"java",
					"-Declipse.application=org.eclipse.jdt.ls.core.id1",
					"-Dosgi.bundles.defaultStartLevel=4",
					"-Declipse.product=org.eclipse.jdt.ls.core.product",
					"-Dlog.protocol=true",
					"-Dlog.level=ALL",
					"-Xmx1G",
					"--add-modules=ALL-SYSTEM",
					"--add-opens",
					"java.base/java.util=ALL-UNNAMED",
					"--add-opens",
					"java.base/java.lang=ALL-UNNAMED",
					"-jar",
					home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
					"-configuration",
					home .. "/.local/share/nvim/mason/packages/jdtls/config_linux", -- Change for macOS or Windows
					"-data",
					workspace_dir,
				},
				root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
				settings = {
					java = {
						signatureHelp = { enabled = true },
						contentProvider = { preferred = "fernflower" },
						completion = {
							favoriteStaticMembers = {
								"org.junit.Assert.*",
								"org.mockito.Mockito.*",
								"java.util.Objects.requireNonNull",
								"java.util.stream.Collectors.toList",
							},
						},
					},
				},
				init_options = {
					bundles = {},
				},
			}

			jdtls.start_or_attach(config)
		end,
	},
}
