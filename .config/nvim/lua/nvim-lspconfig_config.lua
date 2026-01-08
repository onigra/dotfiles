local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config.solargraph = {
  cmd = { 'solargraph', 'stdio' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  capabilities = capabilities,
}
vim.lsp.enable('solargraph')

-- キーマッピング設定
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, noremap = true, silent = true })
  end,
})
