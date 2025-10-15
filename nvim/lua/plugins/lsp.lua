return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "clangd" },
        handlers = {
          function(server)
            vim.lsp.config[server] = {
              capabilities = capabilities,
            }
            vim.lsp.start(vim.lsp.config[server])
          end,
        },
      })
    end,
  },
}
