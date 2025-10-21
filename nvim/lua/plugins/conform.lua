return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			rust = { "rustfmt" },
			go = { "gofmt" },
		},
	},
}
