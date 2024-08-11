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

vim.api.nvim_create_autocmd("BufNewFile", {
    group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
    pattern = { "conjure-log-*" },
    callback = function() vim.diagnostic.disable(0) end,
    desc = "Conjure Log disable LSP diagnostics",
})
