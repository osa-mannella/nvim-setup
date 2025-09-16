-- Bootstrap lazy.nvim if not already installed
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"markdown",
					"markdown_inline",
					"bash",
					"python",
					"typescript",
					"javascript",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	-- Telescope (fuzzy finder + live grep)
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
		end,
	},

	-- Markdown preview in browser

	-- Glow for markdown inside Neovim
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "gofmt" }, -- or "goimports" if you prefer
					rust = { "rustfmt" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					markdown = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 2000,
					lsp_fallback = true,
				},
			})
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({})
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle file tree" })
		end,
	},

	-- Render markdown inline
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				transparent_background = false,
				integrations = {
					treesitter = true,
					telescope = true,
					markdown = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
})
