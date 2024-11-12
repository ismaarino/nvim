-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.maplocalleader = "\\"

local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        "tpope/vim-fugitive",
        tag = "v3.7",
    },
    {
        'vim-airline/vim-airline',
        tag = 'v0.11',
    },
    {
        'vim-airline/vim-airline-themes',
        branch = 'master',
    },
    {
        'goolord/alpha-nvim',
        branch = 'main',
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim"
                },
                opts = { lsp = { auto_attach = true } }
            }
        },
    },
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'hrsh7th/cmp-buffer',
    },
    {
        'hrsh7th/cmp-path',
    },
    {
        'hrsh7th/cmp-cmdline',
    },
    {
        'hrsh7th/nvim-cmp',
    },
    {
        'hrsh7th/cmp-vsnip',
    },
    {
        'hrsh7th/vim-vsnip',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "bash", "c", "cpp", "javascript", "json", "lua",
                    "python", "typescript", "html", "css", "markdown",
                },  -- List of parsers to install
                highlight = {
                    enable = true,              -- false will disable the whole extension
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,              -- Enable indentation based on treesitter
                },
            }
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        tag = 'v0.9.0',
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    {
        "nvim-tree/nvim-tree.lua",
    },
    {
        "sbdchd/neoformat",
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
            { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
            { "stevearc/dressing.nvim", opts = {} },
        },
        config = true
    }
}

local opts = { }

-- Setup lazy.nvim
require("lazy").setup(plugins, opts)
