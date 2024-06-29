return {
    'nvim-lualine/lualine.nvim',

    event = "VeryLazy",

    opts = {
        options = {
            theme = (
                function ()
                    local t = require('lualine.themes.codedark')
                    t.normal.c.bg = '#101010'
                    t.normal.b.bg = '#101010'

                    t.visual.b.bg = '#101010'

                    t.replace.c.bg = '#101010'
                    t.replace.b.bg = '#101010'

                    t.insert.b.bg = '#101010'
                    t.insert.c.bg = '#101010'

                    t.inactive.b.bg = '#101010'
                    return t
                end
            ),
        }
    }
}
