return {
    {
        "navarasu/onedark.nvim",
        name = "Onedark",

        lazy = true,
        priority = 1000,

        opts = {
            style = "warmer",
            colors = {
                bg0 = '#000000',
                bg1 = '#202020',
                bg2 = '#202020',
                bg3 = '#202020',
                -- bg_d = "#000000",
                -- bg_blue = "#000000",
                -- bg_yellow = "#000000",
            },
            highlights = {
                -- ["@lsp.type.variable"] = {fg = '#b3e4ff'},
                -- ["@lsp.type.variable"] = {fg = '#a5cfe6'},
                ["@variable"] = {fg = '#8cafc2'},
                ["@lsp.type.variable"] = {fg = '#8cafc2'},
                ["@tag"] = {fg = '$red'},
                ["@tag.delimiter"] = {fg = '$light_grey'}
            }
        },
        init = function()
            require('onedark').load()
        end
    },

}
