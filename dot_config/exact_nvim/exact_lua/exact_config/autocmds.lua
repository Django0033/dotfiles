local augroup = vim.api.nvim_create_augroup

local filetype_group = augroup("FileTypeSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	group = filetype_group,
	callback = function()
		vim.treesitter.start()
		vim.bo.textwidth = 80
		vim.wo.wrap = true
		vim.wo.linebreak = true
		vim.wo.spell = true
		vim.opt_local.spelllang:append({ "en_us", "es" })
	end,
	desc = "Markdown: treesitter, textwidth, wrap, spell",
})

local insert_group = augroup("InsertMode", { clear = true })
vim.api.nvim_create_autocmd("InsertEnter", {
	group = insert_group,
	callback = function()
		vim.opt.relativenumber = false
	end,
	desc = "Disable relative number on insert enter",
})
vim.api.nvim_create_autocmd("InsertLeave", {
	group = insert_group,
	callback = function()
		vim.opt.relativenumber = true
	end,
	desc = "Enable relative number on insert leave",
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
	desc = "Highlight yanked text",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = augroup("TrimWhitespace", { clear = true }),
	command = "%s/\\s\\+$//e",
	desc = "Trim trailing whitespace on save",
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	pattern = "*",
	group = augroup("AutoSave", { clear = true }),
	command = "silent! update",
	desc = "Auto save on leave or focus lost",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("NoAutoComment", { clear = true }),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable auto comment continuation",
})

vim.api.nvim_create_autocmd("WinEnter", {
	group = augroup("WindowResize", { clear = true }),
	callback = function()
		if vim.api.nvim_win_get_config(0).relative ~= "" then
			return
		end

		local cols = vim.o.columns
		local total_height = vim.o.lines - vim.o.cmdheight
		local win_height = vim.api.nvim_win_get_height(0)

		vim.api.nvim_win_set_width(0, math.floor(cols * 0.7))

		if win_height < total_height - 2 then
			vim.api.nvim_win_set_height(0, math.floor(total_height * 0.7))
		end
	end,
	desc = "Resize normal windows on enter",
})
