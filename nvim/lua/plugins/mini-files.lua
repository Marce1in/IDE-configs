return {
    'echasnovski/mini.files',

    varsion = false,

    opts = {
        mappings = {
            close = '-'
        }
    },
    keys = {
        { "-", mode = { "n", "v"}, function() require("mini.files").open() end, desc = "File Manager" },
    },
}
