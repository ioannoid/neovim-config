-- Configuration
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.wo.number = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.opt.termguicolors = true

-- keymap
require('keymap')

-- lazy
require('lazy-config')
require('lazy').setup({
    'neovim/nvim-lspconfig',
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
    'SmiteshP/nvim-navic',
    'folke/neodev.nvim',
    'numToStr/Comment.nvim',
    {
        'lervag/vimtex',
        lazy = false,
    },
    'saadparwaiz1/cmp_luasnip',
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
    { 'akinsho/bufferline.nvim',         tag = 'v3.2.0' },
    { 'akinsho/toggleterm.nvim' }
})

-- treesitter
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'help' },
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
local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable( -1) then
                luasnip.jump( -1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' }
    })
})
require('cmp').event:on(
    'confirm_done',
    require('nvim-autopairs.completion.cmp').on_confirm_done()
)

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
        }
    }
})

-- lualine
require('lualine').setup()

-- nvim-tree
require('nvim-tree').setup()

-- vim-illuminate
require('illuminate').configure()

-- which-key
require('which-key-config')

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
require('null-ls').setup({
    sources = {
        require('null-ls').builtins.formatting.clang_format
    }
})

-- autopairs
require('nvim-autopairs').setup()
