return {
    "stevearc/oil.nvim",

    event = "VeryLazy",

    config = function ()

        require("oil").setup {
            skip_confirm_for_simple_edits = false,
        }

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
