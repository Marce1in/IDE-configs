return {
    "luukvbaal/nnn.nvim",

    config = function ()
        local builtin = require("nnn").builtin

        require("nnn").setup({
            replace_netrw = "picker",
            mappings = {
                { "<C-s>", builtin.open_in_split },     -- open file(s) in split
                { "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
                { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
                { "<C-w>", builtin.cd_to_path },        -- cd to file directory
                { "<C-e>", builtin.populate_cmdline },  -- populate cmdline (:) with file(s)
            }
        })

        vim.keymap.set("n", "<leader>fe", ":NnnPicker<CR>")
    end
}
