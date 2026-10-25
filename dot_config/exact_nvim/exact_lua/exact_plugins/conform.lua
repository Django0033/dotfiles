vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		markdown = { "prettierd", stop_after_first = true },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		kdl = { "kdlfmt" },
		kotlin = { lsp_format = "fallback" },
	},
	formatters = {
		kdlfmt = {
			command = "kdlfmt",
			args = { "format", "-" },
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = vim.api.nvim_create_augroup("ConformFormat", { clear = true }),
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
	desc = "Format on save with conform",
})
