-- This is the only file that has two plugins in it
-- for me is this is more clear as both are called chezmoi
-- and I have a 1:1 map with plugins names and file names
return {
  {
    "alker0/chezmoi.vim",
    lazy = false,
    init = function()
      -- This option is required.
      vim.g["chezmoi#use_tmp_buffer"] = true
      -- add other options here if needed.
    end,
  },
  {
    'xvzc/chezmoi.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("chezmoi").setup({})
      local telescope = require("telescope")

      telescope.load_extension('chezmoi')
      vim.keymap.set('n', '<leader>sc', telescope.extensions.chezmoi.find_files, {})
    end
  }
}
