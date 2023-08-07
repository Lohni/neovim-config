local lsp = require("lsp-zero")

vim.lsp.set_log_level("debug")

lsp.preset("recommended")

lsp.ensure_installed({
'tsserver',
'eslint',
'omnisharp',
'clangd',
'jdtls',
'kotlin_language_server',
'lua_ls',
'pylsp'
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
	mapping = cmp_mappings
})

