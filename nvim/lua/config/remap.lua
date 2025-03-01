function getCSRByCursorPosition()
	if (vim.api.nvim_win_get_cursor(0)[2] == 0) then return '<Esc>vw<Left>' else return '<Esc><Right>vw<Left>' end
end

function getLineNavigationLeft()
	if (vim.api.nvim_win_get_cursor(0)[2] == 0) then return '<Esc><Up>$i<Right>' else return '<Left>' end
end

function getLineNavigationRight()
	if ((vim.fn.col('.')) == vim.fn.col('$')) then return "<Esc><Down>_i" else return "<Right>" end
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<S-Up>", "<Esc>v<Up>")
vim.keymap.set("i", "<S-Down>", "<Esc>v<Down>")
vim.keymap.set("i", "<C-S-Left>", "<Esc>vb")
vim.keymap.set("v", "<C-S-Left>", "b")
vim.keymap.set("i", "<C-S-Right>", 'v:lua.getCSRByCursorPosition()', { expr = true })
vim.keymap.set("v", "<C-S-Right>", "w")
vim.keymap.set("v", "<C-x>", "d<Esc>i")
vim.keymap.set("v", "<C-c>", "y<Esc>i")
vim.keymap.set("i", "<C-v>", "<Esc>pi")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("i", "<C-f>", "<Esc>/")
vim.keymap.set("n", "<C-f>", "/")
vim.keymap.set("v", "<C-f>", "<Esc>/")
vim.keymap.set("i", "<C-t>", "<Esc>gd")
vim.keymap.set("n", "<C-t>", "gd")
vim.keymap.set("i", "<C-z>", "<Esc>ui")
vim.keymap.set("n", "<C-z>", "ui")
vim.keymap.set("n", "<C-Right>", "<S-Right>")
vim.keymap.set("n", "s", "<nop>")

vim.keymap.set("i", "<A-Left>", "<Esc><C-o>")
vim.keymap.set("n", "<A-Left>", "<C-o>")

vim.keymap.set("i", "<A-Right>", "<Esc><C-i>")
vim.keymap.set("n", "<A-Right>", "<C-i>")

vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "<Left>", 'v:lua.getLineNavigationLeft()', { expr = true })
vim.keymap.set("i", "<Right>", 'v:lua.getLineNavigationRight()', { expr = true })

vim.keymap.set("n", '<S-U-F>', 'v:vim.lsp.buf.format()',  {expr = true})
vim.keymap.set("n", '<A-j>', '<Esc>:m +1<CR>')
vim.keymap.set("n", '<A-k>', '<Esc>:m -2<CR>')

vim.keymap.set("n", '<leader>b', ':DapToggleBreakpoint <CR>')
vim.keymap.set("n", '<leader>db', ':DapContinue <CR>')

