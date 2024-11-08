local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('vim-opts')
require('vim-keys')
require("lazy").setup('plugins')

--  Clojure config
vim.api.nvim_create_autocmd("BufNewFile", {
    group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
    pattern = { "conjure-log-*" },
    callback = function() vim.diagnostic.disable(0) end,
    desc = "Conjure Log disable LSP diagnostics",
})

--  Blade config
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}
vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
