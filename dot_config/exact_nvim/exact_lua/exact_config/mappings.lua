vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, desc, extra)
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", {
		desc = desc,
		noremap = true,
	}, extra or {}))
end

-- Better line-wise navigation
map("n", "k", 'v:count == 0 ? "gk" : "k"', "Better k", { expr = true, silent = true })
map("n", "j", 'v:count == 0 ? "gj" : "j"', "Better j", { expr = true, silent = true })

-- Search results centered
map("n", "n", "nzzzv", "Next search result (centered)")
map("n", "N", "Nzzzv", "Previous search result (centered)")
map("n", "<C-d>", "<C-d>zz", "Half page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Half page up (centered)")

-- Window navigation
map("n", "<C-k>", "<C-w>k", "Focus window up")
map("n", "<C-j>", "<C-w>j", "Focus window down")
map("n", "<C-h>", "<C-w>h", "Focus window left")
map("n", "<C-l>", "<C-w>l", "Focus window right")

-- Move lines
map("n", "<A-j>", ":m .+1<CR>==", "Move line down")
map("n", "<A-k>", ":m .-2<CR>==", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

-- Indent with reselect
map("v", "<", "<gv", "Indent left and reselect")
map("v", ">", ">gv", "Indent right and reselect")

-- Join lines keeping cursor
map("n", "J", "mzJ`z", "Join lines and keep cursor")

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

-- Insert/command mode box-drawing abbreviations
vim.keymap.set("ia", "++", "│")
vim.keymap.set("ia", "+C", "├──")
vim.keymap.set("ia", "+L", "└──")
