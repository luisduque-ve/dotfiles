return {
  {
    "alker0/chezmoi.vim",
    cond = not vim.g.vscode,
    lazy = false,
    init = function()
      -- This option is required.
      vim.g["chezmoi#use_tmp_buffer"] = true
      -- add other options here if needed.
    end,
  },
  {
    "xvzc/chezmoi.nvim",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("chezmoi").setup({
        edit = {
          watch = true,
        },
      })
    end,
  },
}
