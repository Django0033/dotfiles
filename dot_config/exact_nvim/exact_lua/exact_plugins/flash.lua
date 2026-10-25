vim.pack.add({ "https://github.com/folke/flash.nvim" })

require("flash").setup()

local function leadnmap(lhs, rhs, desc)
	vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
end

leadnmap("fj", function()
	require("flash").jump()
end, "[J]ump")

leadnmap("ft", function()
	require("flash").treesitter()
end, "[T]reesitter")

vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Flash Remote" })
