-- vim.pack.add({
-- 	"https://github.com/Django0033/lonelog.nvim",
-- })

require("lonelog").setup({
	use_telescope = false,
	addons = {
		combat = true,
		dungeon = true,
		resources = true,
	},
})
