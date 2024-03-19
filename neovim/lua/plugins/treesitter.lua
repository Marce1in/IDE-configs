return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },

            incremental_selection = {
                enable = false
           }
        }
    },
    {
        'nvim-ts-autotag',
        opts = {}
    }


}
