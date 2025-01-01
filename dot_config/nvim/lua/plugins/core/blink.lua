return {
  -- Blink compat allows to use any cmp source, in my casa I care
  -- about the dap source
  {
    'saghen/blink.compat',
    dependencies = { "rcarriga/cmp-dap", "zbirenbaum/copilot-cmp", },
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    -- dependencies = 'rafamadriz/friendly-snippets',
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      enabled = function()
        return vim.bo.buftype ~= "prompt" or require("cmp_dap").is_dap_buffer()
      end,
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'dap', 'copilot', 'lazydev', },
        providers = {
          dap = { name = "dap", module = "blink.compat.source" },
          copilot = { name = "copilot", module = "blink.compat.source" },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
    opts_extend = { "sources.default" }
  },
}
