vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
})

require("mason").setup({
	ensure_installed = {
		"marksman",
		"stylua",
		"prettierd",
		"kotlin-language-server",
		"typescript-language-server",
		"vscode-css-language-server",
		"vscode-html-language-server",
	},
})
