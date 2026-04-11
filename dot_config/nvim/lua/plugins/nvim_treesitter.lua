vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
    },
})

require("nvim-treesitter").setup()
require('nvim-treesitter').install({ 'rust', 'javascript', 'zig', 'lua' }):wait(300000) -- max. 5 minutes
