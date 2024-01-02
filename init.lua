-- Configuration
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.wo.relativenumber = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.opt.termguicolors = true

-- lazy
require('lazy-config')
require('lazy').setup({
    'neovim/nvim-lspconfig',
    'rafamadriz/friendly-snippets',
    'williamboman/mason-lspconfig.nvim',
    'mfussenegger/nvim-dap',
    'jose-elias-alvarez/null-ls.nvim',
    'williamboman/mason.nvim',
    'RRethy/vim-illuminate',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'nvim-lua/plenary.nvim',
    'windwp/nvim-autopairs',
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-web-devicons',
    'folke/neodev.nvim',
    'numToStr/Comment.nvim',
    'saadparwaiz1/cmp_luasnip',
    {
        'lervag/vimtex',
        lazy = false,
    },
    {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 100
        end
    },
    { 'navarasu/onedark.nvim',           lazy = false },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    { 'nvim-tree/nvim-tree.lua',         tag = 'nightly' },
    { 'akinsho/bufferline.nvim',         version = "*" },
    { 'akinsho/toggleterm.nvim' }
})

-- keymap and which-key
require('keymap')

-- autocommand
require('autocmd')

-- treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'ocaml' },
    sync_install = false,
    auto_install = true,
    ignore_install = { 'haskell' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})

-- colorscheme
require('onedark').setup({
    style = 'darker'
})
require('onedark').load()

-- nvim-cmp
require('cmp-config')

-- toggleterm
require('toggleterm').setup({
    open_mapping = [[<c-\>]],
    insert_mappings = true,
    direction = 'float',
    shade_terminals = true
})

-- bufferline
require('bufferline').setup({
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                    or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end
    }
})

-- lualine
require("lualine").setup()

-- nvim-tree
require('nvim-tree').setup()

-- vim-illuminate
require('illuminate')

-- mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- comment
require('Comment').setup({
    toggler = {
        line = '<leader>/'
    },
    opleader = {
        line = '<leader>/'
    }
})

-- neodev
require('neodev').setup()

-- lspconfig
require('lsp-config')

-- null-ls
local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.ocamlformat
    }
})

-- autopairs
require('nvim-autopairs').setup()
