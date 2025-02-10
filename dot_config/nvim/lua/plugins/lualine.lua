return {
  "nvim-lualine/lualine.nvim",
  cond = not vim.g.vscode,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.opt.showtabline = 0
    require("lualine").setup({
      options = {
        theme = "gruvbox_dark",
      },
      sections = {
        lualine_b = { "branch" },
        lualine_x = { "searchcount", "filetype" },
      },
    })
  end,
}
