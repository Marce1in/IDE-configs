return {
    'echasnovski/mini.files',

    varsion = false,

    opts = {
        mappings = {
            close = '-'
        },

        options = {
            use_as_default_explorer = true
        }
    },
    keys = {
        { "-", mode = { "n", "v"}, function() require("mini.files").open() end, desc = "File Manager" },
    },
}
