vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
})

require("blink.cmp").setup({
	keymap = { preset = "default" },
	appearance = { nerd_font_variant = "mono" },
	completion = {
		menu = { auto_show = true },
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
	},
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = { preset = "luasnip" },

	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
})
