vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
			},
		},
	},
})

local function leadnmap(lhs, rhs, desc)
	vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
end

leadnmap("<leader>", ":Telescope buffers<CR>", "[ ] Find existing buffers")
leadnmap("s.", ":Telescope oldfiles<CR>", "[.] Recent Files")
leadnmap("sc", ":Telescope commands<CR>", "[C]ommands")
leadnmap("sC", ":Telescope colorscheme<CR>", "[C]olorscheme")
leadnmap("sd", ":Telescope diagnostics<CR>", "[D]iagnostics")
leadnmap("sf", ":Telescope find_files<CR>", "[F]iles")
leadnmap("sg", ":Telescope live_grep<CR>", "[G]rep")
leadnmap("sh", ":Telescope help_tags<CR>", "[H]elp")
leadnmap("sk", ":Telescope keymaps<CR>", "[K]eymaps")
leadnmap("sm", ":Telescope marks<CR>", "[M]arks")
leadnmap("sr", ":Telescope registers<CR>", "[R]egisters")
leadnmap("ss", ":Telescope spell_suggest<CR>", "[S]pell")
