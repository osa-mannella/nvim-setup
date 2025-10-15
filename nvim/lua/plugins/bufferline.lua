return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufAdd",
  config = function()
    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        separator_style = "thin",
      },
    })
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true })
  end,
}

