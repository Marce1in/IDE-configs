return {
    "AckslD/nvim-neoclip.lua",

    event = "VeryLazy",
    dependencies = {
        {'nvim-telescope/telescope.nvim'},
    },
    opts = {
        default_register = {'"', "+", "*"}
    },
    keys = {
        {"<leader>fc", mode = { "n", "v" }, function() require('telescope').extensions.neoclip.default() end}
    }
}
