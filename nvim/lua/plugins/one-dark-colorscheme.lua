return {
  {
    "navarasu/onedark.nvim",
    name = "Onedark",
    priority = 1000,
    opts = {
      style = "warmer",
      highlights = {
        -- ["@lsp.type.variable"] = {fg = '#b3e4ff'},
        -- ["@lsp.type.variable"] = {fg = '#a5cfe6'},
        ["@variable"] = {fg = '#8cafc2'},
        ["@lsp.type.variable"] = {fg = '#8cafc2'},
        ["@tag"] = {fg = '$red'},
        ["@tag.delimiter"] = {fg = '$light_grey'}
      }
    },
    init = function()
      require('onedark').load()
    end
  },

}
