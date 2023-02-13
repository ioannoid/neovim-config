local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 150 })
    end
})

autocmd('BufWrite', {
    callback = function()
        vim.lsp.buf.format()
    end
})
