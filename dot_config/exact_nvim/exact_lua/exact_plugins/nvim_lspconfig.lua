vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable("marksman")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("kotlin", {
	cmd = { "kotlin-language-server" },
	filetypes = { "kotlin" },
	root_markers = { "settings.gradle.kts", "settings.gradle", "build.gradle.kts", "build.gradle", "pom.xml", "mvnw" },
})

vim.lsp.config("typescript", {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
})

vim.lsp.config("css", {
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".stylelintrc", "postcss.config.js" },
})

vim.lsp.config("html", {
	filetypes = { "html" },
	root_markers = { "package.json" },
})

vim.lsp.enable("css")
vim.lsp.enable("kotlin")
vim.lsp.enable("lua_ls")
vim.lsp.enable("typescript")
vim.lsp.enable("html")
