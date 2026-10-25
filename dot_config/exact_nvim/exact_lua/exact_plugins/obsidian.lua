vim.pack.add({
	"https://github.com/obsidian-nvim/obsidian.nvim",
})

require("obsidian").setup({
	legacy_commands = false,
	workspaces = {
		{
			name = "roleplay",
			path = "~/Documents/Roleplay/",
		},

		{
			name = "zettelkasten",
			path = "~/Documents/zettelkasten/",
		},

		{
			name = "deckbox",
			path = "~/Documents/deckbox/",
		},
	},

	note_id_func = function(title)
		local suffix = ""
		if title ~= nil then
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,

	-- completion = (function()
	-- 	local has_nvim_cmp, _ = pcall(require, "cmp")
	-- 	local has_blink = pcall(require, "blink.cmp")
	-- 	return {
	-- 		nvim_cmp = has_nvim_cmp and not has_blink,
	-- 		blink = has_blink,
	-- 		min_chars = 2,
	-- 		match_case = true,
	-- 		create_new = true,
	-- 	}
	-- end)(),

	picker = {
		name = "telescope.nvim",
		note_mappings = {
			new = "<C-x>",
			insert_link = "<C-l>",
		},
		tag_mappings = {
			tag_note = "<C-x>",
			insert_tag = "<C-l>",
		},
	},
})

local function leadnmap(lhs, rhs, desc)
	vim.keymap.set("n", "<leader>" .. lhs, rhs, { desc = desc })
end

leadnmap("oT", ":Obsidian toc<CR>", "[T]oc")
leadnmap("on", ":Obsidian new<CR>", "[N]ew")
leadnmap("op", ":Obsidian paste_img<CR>", "[P]aste img")
leadnmap("oq", ":Obsidian quick_switch<CR>", "[Q]uick Switch")
leadnmap("ot", ":Obsidian tags<CR>", "[T]ags")
leadnmap("ow", ":Obsidian workspace<CR>", "[W]orkspaces")
