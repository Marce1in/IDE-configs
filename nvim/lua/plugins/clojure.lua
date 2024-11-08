return {
    {
        "Olical/conjure",
        ft = { "clojure" }, -- etc
        lazy = true,
        init = function()
            -- Set configuration options here
            -- vim.g["conjure#debug"] = true
            vim.g["conjure#eval#result_register"] = "*"
        end,

        -- Optional cmp-conjure integration
        dependencies = { "PaterJason/cmp-conjure" },
    },
    {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, { name = "conjure" })
            return cmp.setup(config)
        end,
    },
    {
        'clojure-vim/vim-jack-in',
        dependencies = { 'tpope/vim-dispatch', 'radenling/vim-dispatch-neovim' }
    }
}
