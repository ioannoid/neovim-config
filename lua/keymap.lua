local map = vim.api.nvim_set_keymap

-- leader
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local wk = require('which-key');
-- local lsp = require('lspconfig');

local M = {}

-- vim.keymap.set('n', '<space>i', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

wk.setup()
wk.register({
    L = {
        name = 'LSP',
        I = { ':LspInfo<cr>', 'Info' }
    },
    e = { ':NvimTreeToggle<cr>', 'Toggle File Explorer' },
    E = { ':NvimTreeFocus<cr>', 'Focus File Explorer' }
}, { prefix = '<leader>' })

function M.lsp_on_attach(bufnr)
    wk.register({
        L = {
            name = 'LSP',
            D = { vim.lsp.buf.declaration, 'Declaration', buffer = bufnr },
            d = { vim.lsp.buf.definition, 'Definition', buffer = bufnr },
            K = { vim.lsp.buf.hover, 'Hover', buffer = bufnr },
            i = { vim.lsp.buf.implementation, 'Implementation', buffer = bufnr },
            f = { function() vim.lsp.buf.format { async = true } end, 'Format', buffer = bufnr }
        }
    }, { prefix = '<leader>' })
end

return M
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--     vim.keymap.set('n', '<space>wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, bufopts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
