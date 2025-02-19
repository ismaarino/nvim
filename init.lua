vim.cmd('set title')
vim.cmd('set number')
vim.cmd('set mouse=a')

vim.cmd('set cursorline')

vim.cmd('set list')
vim.cmd('set listchars=tab:»·,trail:·,space:·')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftround')
vim.cmd('set expandtab')
vim.cmd('set hidden')
vim.cmd('set ignorecase')
vim.cmd('set smartcase')

vim.cmd('set fileformats=unix')

vim.cmd('set spelllang=en,es')
    
vim.cmd('set termguicolors')
vim.cmd('set background=dark')

vim.g.mapleader = ' '

require('config.lazy') -- Lazy Package Manager https://github.com/folke/lazy.nvim --
require('config.tree') -- Lazy Package Manager https://github.com/folke/lazy.nvim --
require('config.telescope') -- Telescope File Finder https://github.com/nvim-telescope/telescope.nvim --
require('config.alpha') -- Dashboard https://github.com/goolord/alpha-nvim --
require('config.lsp') -- LSP Config --
-- require('config.lsp.biome')
-- require('config.lsp.eslint')
-- require('config.lsp.jdtls')
-- require('config.lsp.ts_lsp')
-- require('config.lsp.omnisharp')
-- require('config.lsp.ccls')
require('config.format') -- Formatters Config --
require('config.git') -- Git integration in editor https://github.com/lewis6991/gitsigns.nvim --
-- require('config.codecompanion') -- AI Copilot https://github.com/olimorris/codecompanion.nvim --

vim.cmd('colorscheme nordic')
vim.cmd('AirlineTheme base16')

local function exit()
    vim.cmd('qa!')
end
vim.keymap.set({'n', 'v', 's', 't'}, '<leader><Del>', exit, { desc = 'Exit All' })

local function save_file()
    vim.cmd('w!')
end
vim.keymap.set({'n', 'v', 's', 't'}, '<leader>s', save_file, { desc = 'Save file' })
vim.keymap.set({'n', 'v', 's', 't'}, '<leader>S', save_file, { desc = 'Save file' })
vim.keymap.set({'n', 'i', 'v', 's', 't'}, '<C-s>', save_file, { desc = 'Save file' })
vim.keymap.set({'n', 'i', 'v', 's', 't'}, '<C-S>', save_file, { desc = 'Save file' })

local function delete_buffer()
    vim.cmd('bdelete!')
end
vim.keymap.set({'n', 'v', 's', 't'}, '<leader><Esc>', delete_buffer, { desc = 'Delete Current Buffer' })

local function goto_bottom()
    vim.cmd('$')
end
vim.keymap.set({'n', 'v', 's', 't'}, '<S-j>', goto_bottom, { desc = 'Go to bottom' })
vim.keymap.set({'n', 'v', 's', 't'}, '<S-k>', 'gg', { desc = 'Go to top' })

vim.keymap.set({ 'n', 'v' }, '<Tab>', '>>', { desc = 'Tabulate Out' })
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', '<<', { desc = 'Tabulate In' })
