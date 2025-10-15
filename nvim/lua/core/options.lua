local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.wrap = false
opt.cursorline = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "YankHighlight",
			timeout = 150,
		})
	end,
})

vim.api.nvim_set_hl(0, "YankHighlight", { fg = "NONE", bg = "#f6c177", bold = true })
