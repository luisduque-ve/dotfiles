-- why this plugin if I have fzf-lua?
-- for new projects where I don't know the file
-- structure, that's all.
return {
  "nvim-tree/nvim-tree.lua",
  cond = not vim.g.vscode,
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        number = true,
        relativenumber = true,
      },
    })
  end,
  keys = {
    { "<C-b>", "<CMD>NvimTreeToggle<CR>", desc = "nvim_tree" },
  },
}
