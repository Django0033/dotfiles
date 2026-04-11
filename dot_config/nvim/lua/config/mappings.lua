vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function nmap(lhs, rhs, desc, opts)
	local options = { desc = desc, noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set("n", lhs, rhs, options)
end

nmap("k", 'v:count == 0 ? "gk" : "k"', "Better k", { expr = true, silent = true })
nmap("j", 'v:count == 0 ? "gj" : "j"', "Better j", { expr = true, silent = true })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

nmap("<C-k>", "<C-w>k", "Focus window up")
nmap("<C-j>", "<C-w>j", "Focus window down")
nmap("<C-h>", "<C-w>h", "Focus window left")
nmap("<C-l>", "<C-w>l", "Focus window right")

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("ia", "++", "│")
vim.keymap.set("ia", "+C", "├──")
vim.keymap.set("ia", "+L", "└──")
