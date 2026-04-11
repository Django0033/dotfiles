vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
})

local function leadnmap(lhs, rhs, desc)
	vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
end

require("mini.icons").setup()
require("mini.clue").setup({
	triggers = {
		-- Leader triggers
		{ mode = { "n", "x" }, keys = "<Leader>" },

		-- `[` and `]` keys
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = { "n", "x" }, keys = "g" },

		-- Marks
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },

		-- Registers
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = { "n", "x" }, keys = "z" },

		-- Mini surround
		{ mode = { "n", "x" }, keys = "s" },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		require("mini.clue").gen_clues.square_brackets(),
		require("mini.clue").gen_clues.builtin_completion(),
		require("mini.clue").gen_clues.g(),
		require("mini.clue").gen_clues.marks(),
		require("mini.clue").gen_clues.registers(),
		require("mini.clue").gen_clues.windows(),
		require("mini.clue").gen_clues.z(),
		{ mode = "n", keys = "<leader>s", desc = "+[S]earch" },
		{ mode = "n", keys = "<leader>l", desc = "+[L]onelog" },
		{ mode = "n", keys = "<leader>ld", desc = "+[L]onelog [D]ice" },
	},
})
require("mini.icons").setup()
require("mini.files").setup()
require("mini.extra").setup()
require("mini.surround").setup()
require("mini.pick").setup()
leadnmap("<leader>", ":Pick buffers<CR>", "[ ] Find existing buffers")
leadnmap("sd", ":Pick diagnostic<CR>", "[S]earch [D]iagnostics")
leadnmap("sf", ":Pick files<CR>", "[S]earch [F]iles")
leadnmap("sg", ":Pick grep_live<CR>", "[S]earch by [G]rep")
leadnmap("sh", ":Pick help<CR>", "[S]earch [H]elp")
leadnmap("sk", ":Pick keymaps<CR>", "[S]earch [K]eymaps")
leadnmap("sc", ":Pick commands<CR>", "[S]earch [C]ommands")
leadnmap("s.", ":Pick oldfiles<CR>", "[S]earch Recent Files ('.' for repeat)")
