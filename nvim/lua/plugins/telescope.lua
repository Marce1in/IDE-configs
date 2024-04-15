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

        local fb_actions = require('telescope._extensions.file_browser.actions')

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

                ["file_browser"] = {
                    path = vim.loop.cwd(),
                    cwd = vim.loop.cwd(),
                    cwd_to_path = false,
                    grouped = false,
                    files = true,
                    add_dirs = true,
                    depth = 1,
                    auto_depth = false,
                    select_buffer = false,
                    hidden = { file_browser = false, folder_browser = false },
                    respect_gitignore = vim.fn.executable "fd" == 1,
                    no_ignore = false,
                    follow_symlinks = false,
                    browse_files = require("telescope._extensions.file_browser.finders").browse_files,
                    browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
                    hide_parent_dir = true,
                    collapse_dirs = false,
                    prompt_path = false,
                    quiet = false,
                    dir_icon = "",
                    dir_icon_hl = "Default",
                    display_stat = false,
                    hijack_netrw = true,
                    use_fd = true,
                    git_status = true,
                    mappings = {
                        ["n"] = {
                            ["v"] = fb_actions.move,
                            ["p"] = fb_actions.copy,
                            ["n"] = fb_actions.create,
                            ["r"] = fb_actions.rename,
                            ["x"] = fb_actions.remove,
                            ["h"] = fb_actions.goto_parent_dir,
                            ["."] = fb_actions.toggle_hidden,
                            ["a"] = fb_actions.toggle_all,
                        },
                    },
                }
            }
        }
            require('telescope').load_extension('ui-select')
            require('telescope').load_extension('file_browser')

            vim.keymap.set('n', 'fe', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', {})

    end
}
