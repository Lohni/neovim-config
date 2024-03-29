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

  vim.keymap.set("n", "<C-Enter>", function() vim.lsp.buf.code_action() end, {buffer = bufnr, remap = false})
end)

-- Run omnisharp not in single file mode
local nvim_lsp = require('lspconfig')
local pid = vim.fn.getpid()
local start = os.getenv('MASON') .. "\\packages\\omnisharp\\libexec\\omnisharp.exe"
lsp.configure('omnisharp', {
    cmd = {start},
    root_dir = nvim_lsp.util.root_pattern("*.csproj", "*.sln"),
    useModernNet = false,
    sdkPath = ""
})

lsp.setup()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.close(),
})

cmp.setup({
	mapping = cmp_mappings
})


