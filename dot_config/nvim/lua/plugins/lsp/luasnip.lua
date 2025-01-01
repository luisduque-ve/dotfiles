return {
  "L3MON4D3/LuaSnip",
  version = "1.*",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.local/share/chezmoi/dot_config/nvim/snippets/vscode" })
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged, TextChangedI",
      enable_autosnippets = true,
    })

    vim.keymap.set("i", "<c-l>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)
  end,
}
