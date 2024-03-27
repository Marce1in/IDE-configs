return {
    {
        'williamboman/mason.nvim',
        opts = {}
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'lua_ls',
                'clangd',
                'html',
                'cssls',
                'tailwindcss',
                'tsserver',
                'dockerls',
            }
        }
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local cap = require('cmp_nvim_lsp').default_capabilities()
            local lsp = require('lspconfig')

            lsp.lua_ls.setup {capabilities = cap}
            lsp.clangd.setup {capabilities = cap}
            lsp.html.setup {capabilities = cap}
            lsp.cssls.setup {capabilities = cap}
            lsp.tailwindcss.setup {capabilities = cap}
            lsp.tsserver.setup {capabilities = cap}
            lsp.dockerls.setup {capabilities = cap}

            vim.keymap.set('n', 'ge', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
            vim.keymap.set('n', 'gf', vim.lsp.buf.format, {})
            vim.keymap.set('n', 'ç', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

        end
    }
}
