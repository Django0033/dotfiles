-- vim.pack.add("file:///home/django/repos/kleros.nvim/")
require("kleros").setup()

local function leadnmap(lhs, rhs, desc)
	vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
end

leadnmap("kia", ":Kleros isAction<CR>", "[A]ction")
leadnmap("kidn", ":Kleros isDelveSiteName<CR>", "[N]ame")
leadnmap("kisn", ":Kleros isSettlementNameGenerator<CR>", "[N]ame Generator")
leadnmap("kjf", ":Kleros jNameGenerator!<CR>", "[F]emale Name")
leadnmap("kjm", ":Kleros jNameGenerator?<CR>", "[M]ale Name")
leadnmap("kjn", ":Kleros jNameGenerator<CR>", "[N]ame Generator")
