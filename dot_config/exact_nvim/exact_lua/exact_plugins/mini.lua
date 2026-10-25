vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
})

require("mini.statusline").setup()
-- require("mini.cmdline").setup({
-- 	autocorrect = { enable = false },
-- })
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

		{ mode = "n", keys = "<leader>k", desc = "+[K]leros" },
		{ mode = "n", keys = "<leader>ki", desc = "+[I]ronsworn" },
		{ mode = "n", keys = "<leader>kic", desc = "+[C]haracter" },
		{ mode = "n", keys = "<leader>kid", desc = "+[D]elve" },
		{ mode = "n", keys = "<leader>kis", desc = "+[S]ettlement" },
		{ mode = "n", keys = "<leader>kj", desc = "+[J]uice" },
		{ mode = "n", keys = "<leader>l", desc = "+[L]onelog" },
		{ mode = "n", keys = "<leader>ld", desc = "+[L]onelog [D]ice" },
		{ mode = "n", keys = "<leader>o", desc = "+[O]bsidian" },
		{ mode = "n", keys = "<leader>r", desc = "+[R]oll" },
		{ mode = "n", keys = "<leader>rc", desc = "+[C]haracter" },
		{ mode = "n", keys = "<leader>rh", desc = "+[H]ex" },
		{ mode = "n", keys = "<leader>rl", desc = "+[L]ocation" },
		{ mode = "n", keys = "<leader>rm", desc = "+[M]eaning" },
		{ mode = "n", keys = "<leader>rt", desc = "+Crea[T]ure" },
		{ mode = "n", keys = "<leader>rx", desc = "+E[X]pand" },
		{ mode = "n", keys = "<leader>ry", desc = "+M[Y]stery" },
		{ mode = "n", keys = "<leader>s", desc = "+[S]earch" },
		{ mode = "n", keys = "<leader>e", desc = "+Op[E]ncode" },
	},
})
require("mini.files").setup()
require("mini.extra").setup()
require("mini.surround").setup()
require("mini.pairs").setup({
	modes = { insert = true, command = false, terminal = false },

	mappings = {
		["<"] = { action = "open", pair = "<>", neigh_pattern = "^[^\\]" },
		[">"] = { action = "close", pair = "<>", neigh_pattern = "^[^\\]" },
	},
})
