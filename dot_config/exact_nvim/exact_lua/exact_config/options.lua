-- Basic settings
vim.o.cursorline = true -- Highlight current line
vim.o.number = true -- Show line number
vim.o.relativenumber = true -- Show relative line number
vim.o.scrolloff = 9 -- Stop scroll at `n` lines
vim.o.sidescrolloff = 9 -- Stop side scroll at `n` columns
vim.o.wrap = true -- Wraps long lines

-- Indentation
vim.o.autoindent = true -- Copy indent from current line?
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 4 -- Number of spaces per tab
vim.o.smartindent = true -- Smart auto-indenting?
vim.o.softtabstop = 4 -- Soft tab stop?
vim.o.tabstop = 4 -- Lenght of a tab

-- Search settings
vim.o.hlsearch = false -- No highlight search
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.incsearch = true -- Show matches as you type?
vim.o.smartcase = true -- Recognize a upper case charater in search patterns

-- Visual settings
vim.o.breakindent = true -- Indents wrapped lines
vim.o.colorcolumn = "80" -- Mark the 80th col
vim.o.completeopt = "fuzzy,noselect,menu,menuone" -- Check :h completeopt
vim.o.inccommand = "split" -- Preview substitutions live
vim.o.linebreak = true -- Wraps at words.
vim.o.numberwidth = 2 -- Num col width
vim.o.pumblend = 10 -- Popup transparency
vim.o.pumheight = 9 -- Popup height
vim.o.showmode = false -- Don't show mode in command line
vim.o.signcolumn = "yes" -- Show sign column
vim.o.wildmode = "longest:full,full"
vim.o.winblend = 10 -- Floating window transparency
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.showmatch = true -- highlights matching brackets
vim.o.cmdheight = 1 -- single line command line
vim.opt.conceallevel = 1 -- do not hide markup

-- File handling
vim.o.confirm = true -- Confirm save before exit
vim.o.formatoptions = "jcroqlnt" -- :h fo-table
vim.o.grepformat = "%f:%l:%c:%m" -- :h grepformat
vim.o.swapfile = false -- Create swap file
vim.o.timeout = true -- Wait between keymaps
vim.o.timeoutlen = 3000
vim.o.undofile = true -- Creates an undofile
vim.o.undolevels = 10000

-- Behavior settings
vim.o.hidden = true -- Buffer becomes hidden when abandoned
vim.o.autochdir = true -- Change dir to current file dir
-- vim.o.path:append("**")         -- Include subdirectories in search
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.splitbelow = true

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal

vim.g.markdown_recommended_style = 0

vim.g.markdown_fenced_languages = {
	"html",
	"javascript",
	"typescript",
	"css",
	"scss",
	"lua",
	"vim",
	"python",
	"bash",
}
