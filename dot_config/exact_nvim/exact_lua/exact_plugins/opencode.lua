vim.pack.add({
	{
		src = "https://github.com/nickjvandyke/opencode.nvim",
		version = vim.version.range("*"), -- Latest stable release
	},
})

---@type opencode.Opts
vim.g.opencode_opts = {
	-- Your configuration, if any; goto definition on the type for details
}

vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

-- Ask / select
local opencode = require("opencode")

vim.keymap.set({ "n", "x" }, "<leader>ea", function()
	opencode.ask("@this: ")
end, { desc = "[A]sk" })

vim.keymap.set({ "n", "x" }, "<leader>es", function()
	opencode.select()
end, { desc = "[S]elect" })

-- Operator (range / line)
vim.keymap.set({ "n", "x" }, "go", function()
	return opencode.operator("@this ")
end, { desc = "Append range to OpenCode", expr = true })

vim.keymap.set("n", "goo", function()
	return opencode.operator("@this ") .. "_"
end, { desc = "Append line to OpenCode", expr = true })

-- Scroll
vim.keymap.set("n", "<S-C-u>", function()
	opencode.command("session.half.page.up")
end, { desc = "Scroll OpenCode up" })

vim.keymap.set("n", "<S-C-d>", function()
	opencode.command("session.half.page.down")
end, { desc = "Scroll OpenCode down" })
