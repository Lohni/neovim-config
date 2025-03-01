local lsp = require("lsp-zero")

vim.lsp.set_log_level("debug")

lsp.preset("recommended")

lsp.ensure_installed({
'eslint',
'clangd',
'lua_ls',
'zls',
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
local startClangd = os.getenv('MASON') .. "\\packages\\clangd\\clangd_19.1.0\\bin\\clangd.exe"
lsp.configure('omnisharp', {
})

nvim_lsp.omnisharp.setup({
    cmd = {start, "--languageserver", "--hostPID", tostring(pid)},
    root_dir = nvim_lsp.util.root_pattern("*.csproj", "*.sln"),
    useModernNet = false
})

nvim_lsp.clangd.setup({
	cmd = {
		startClangd,
	    "--background-index",
		"--log=verbose"
	}
})


lsp.setup()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
    ['<Esc>'] = cmp.mapping.close(),
})

cmp.setup({
	mapping = cmp_mappings
})
