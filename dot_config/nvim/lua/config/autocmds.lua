vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.treesitter.start()
        vim.cmd("setlocal textwidth=80")
        vim.cmd("setlocal wrap linebreak")
        vim.cmd("setlocal spell spelllang=en_us,es")
    end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = false
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = function()
        vim.opt.relativenumber = true
    end,
})

-- [[ Highlight on yank ]]
-- See `:help vim.hl.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})
-- [[]]

-- [[ Remove trailing whitespace on save ]]
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})
-- [[]]

-- [[ Smart auto-save with update command ]]
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
    pattern = "*",
    command = "silent! update",
    desc = "Auto-save on leave/lost focus",
})
-- [[]]

-- [[ No auto continue comments on new line ]]
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("no_auto_comment", {}),
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})
-- [[]]

-- [[ Autoformat when saving ]]
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end,
})
-- [[]]

vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        if vim.api.nvim_win_get_config(0).relative ~= "" then return end

        local current_win = 0
        local total_height = vim.o.lines - vim.o.cmdheight
        local win_height = vim.api.nvim_win_get_height(current_win)

        local target_width = math.floor(vim.o.columns * 0.7)
        vim.api.nvim_win_set_width(current_win, target_width)

        if win_height < (total_height - 2) then
            local target_height = math.floor(total_height * 0.7)
            vim.api.nvim_win_set_height(current_win, target_height)
        end
    end,
})
