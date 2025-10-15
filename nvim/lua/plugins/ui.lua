
return {
  -- Notification UI (used by noice)
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        timeout = 2000,
        render = "compact",
      })
      vim.notify = require("notify")
    end,
  },

  -- Fancy UI framework
  { "MunifTanjim/nui.nvim" },

  -- Better command line / messages
{
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
  },
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { icon = "" },
        search_down = { kind = "search", pattern = "^/", icon = "" },
        search_up = { kind = "search", pattern = "^%?", icon = "" },
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
}
}
