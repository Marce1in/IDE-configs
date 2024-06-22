return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },

        'nvim-tree/nvim-web-devicons',
    },


    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        require("telescope").setup {

            defaults = {

                mappings = {
                    n = {
                        [" "] = "toggle_selection",
                        ["l"] = "select_default"
                    }
                },

            },

            extensions = {

                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                },
            }
        }
            require('telescope').load_extension('ui-select')

    end
}
