return {
    {
        'hrsh7th/nvim-cmp',


        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp'
        },

        event = "VeryLazy",

        config = function()
            local cmp = require('cmp')
            local ls = require('luasnip')

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert {

                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },

                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' }
                    },
                    {
                        { name = 'buffer' }
                    })
            }

            vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump(-1) end, {silent = true})

            cmp.setup.filetype({"sql", "mysql", "plsql"}, {
                sources = {
                    {name = "vim-dadbod-completion"},
                    {name = "buffer"}
                },
            })
        end
    }
}
