return {
  {
    "folke/lazydev.nvim",
    cond = not vim.g.vscode,
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "Bilal2453/luvit-meta",
    cond = not vim.g.vscode,
    lazy = true
  }, -- optional `vim.uv` typings
}
