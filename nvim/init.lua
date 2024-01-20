vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.clipboard = unnamed

vim.keymap.set('n', '<C-p>', ':Prettier<CR>')
vim.keymap.set('n', '<C-w>', ':terminal<CR>')
vim.keymap.set('n', '<C-f>', ':NERDTreeToggle<CR>')

local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('bluz71/vim-nightfly-colors', { as = 'nightfly' })
Plug('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production' })
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' 
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/preservim/tagbar' 
Plug 'https://github.com/neoclide/coc.nvim' 
Plug 'https://github.com/vim-airline/vim-airline'

vim.call('plug#end')

vim.cmd.colorscheme 'nightfly'

