return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",

        opts = {
            auto_install = true,

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },

            incremental_selection = {
                enable = false
            },

        }
    },
    {
        'windwp/nvim-ts-autotag',
        opts = {
            enable_close_on_slash = false -- Auto close on trailing </
        },
    },
}
