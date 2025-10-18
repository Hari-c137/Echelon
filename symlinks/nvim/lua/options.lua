vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.confirm = true

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

