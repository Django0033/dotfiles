vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	image = {
		resolve = function(path, src)
			local api = require("obsidian.api")
			if api.path_is_note(path) then
				return api.resolve_attachment_path(src)
			end
		end,
	},

	dashboard = {
		width = 64,
		preset = {
			keys = {
				{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
				{
					icon = " ",
					key = "g",
					desc = "Find Text",
					action = ":lua Snacks.dashboard.pick('live_grep')",
				},
				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
				},
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
			{ section = "recent_files", limit = 8, icon = " ", indent = 2, padding = 1 },
		},
	},
})
