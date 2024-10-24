return {
    -- {
    --     'saghen/blink.cmp',
    --     lazy = false, -- lazy loading handled internally
    --     -- optional: provides snippets for the snippet source
    --
    --     -- use a release tag to download pre-built binaries
    --     version = 'v0.*',
    --     -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    --     -- build = 'cargo build --release',
    --     -- On musl libc based systems you need to add this flag
    --     -- build = 'RUSTFLAGS="-C target-feature=-crt-static" cargo build --release',
    --
    --     opts = {
    --         highlight = {
    --             -- sets the fallback highlight groups to nvim-cmp's highlight groups
    --             -- useful for when your theme doesn't support blink.cmp
    --             -- will be removed in a future release, assuming themes add support
    --             use_nvim_cmp_as_default = true,
    --         },
    --         -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    --         -- adjusts spacing to ensure icons are aligned
    --         nerd_font_variant = 'mono',
    --
    --         -- experimental auto-brackets support
    --         -- accept = { auto_brackets = { enabled = true } }
    --
    --         -- experimental signature help support
    --         -- trigger = { signature_help = { enabled = true } }
    --     }
    -- },
    {
        "iguanacucumber/magazine.nvim",
        name = "nvim-cmp", -- Otherwise highlighting gets messed up

        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'onsails/lspkind.nvim',
            'rafamadriz/friendly-snippets'
        },

        event = "VeryLazy",

        config = function()
            local cmp = require('cmp')
            local ls = require('luasnip')
            local lspkind = require('lspkind')

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup {
                formatting = {
                    format = lspkind.cmp_format {
                        maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        show_labelDetails = true, -- show labelDetails in menu. Disabled by default
                    },

                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                window = {
                    -- completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert {

                    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-k>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- altgr + o and altgr + p in abnt2 layouts
                    ['<C-o>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },

                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                        { name = 'path'},
                        { name = 'buffer' },
                    })
            }

            -- cmp.setup.cmdline(':', {
            --     mapping = cmp.mapping.preset.cmdline(),
            --     sources = cmp.config.sources({
            --         { name = 'path' }
            --     }, {
            --             {
            --                 name = 'cmdline',
            --                 option = {
            --                     ignore_cmds = { 'Man', '!' }
            --                 }
            --             }
            --         })
            -- })

            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent = true})
        end
    },
}
