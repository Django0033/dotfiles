require("plugins.colorschemes")
require("plugins.mason")
require("plugins.mini")
require("plugins.nvim_lspconfig")
require("plugins.obsidian")
require("plugins.gitsigns")
require("plugins.nvim_treesitter")
require("plugins.blink")
require("plugins.conform")
require("plugins.lonelog")
require("plugins.mythic")
require("plugins.vim_scimark")
require("plugins.kleros")
require("plugins.kitty_scrollback")
vim.cmd("packadd nvim.undotree")
require("vim._core.ui2").enable({
	enable = true, -- Whether to enable or disable the UI.
	msg = { -- Options related to the message module.
		---@type 'cmd'|'msg' Default message target, either in the
		---cmdline or in a separate ephemeral message window.
		---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
		---or table mapping |ui-messages| kinds and triggers to a target.
		targets = "cmd",
		cmd = { -- Options related to messages in the cmdline window.
			height = 0.5, -- Maximum height while expanded for messages beyond 'cmdheight'.
		},
		dialog = { -- Options related to dialog window.
			height = 0.5, -- Maximum height.
		},
		msg = { -- Options related to msg window.
			height = 0.5, -- Maximum height.
			timeout = 4000, -- Time a message is visible in the message window.
		},
		pager = { -- Options related to message window.
			height = 1, -- Maximum height.
		},
	},
})
