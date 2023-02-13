-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local k = require('keymap')
    -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
    k.lsp_on_attach(bufnr)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require('lspconfig')['ocamllsp'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}


require('lspconfig')['lua_ls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    },
    capabilities = capabilities
}
