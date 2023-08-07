function ColorMyPencils(color)
	require('gruvbox').setup({
		overrides = {
			Keyword = {fg = "#b45ae0"},
			Conditional = {fg = "#b45ae0"},
			Repeat = {fg = "#b45ae0"},
			Label = {fg = "#b45ae0"},
			Exception = {fg = "#b45ae0"},
			Operator = {fg = "#90d7bb"},
			StorageClass = {fg = "#b45ae0"},
			Structure = {fg = "#b45ae0"},
			Include = {fg = "#b45ae0"}
		}
	})

	color = color or 'gruvbox'
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

