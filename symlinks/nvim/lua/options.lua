vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.confirm = true

-- vim.opt.signcolumn = "yes:1"
-- vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
-- vim.opt.list = true
-- vim.opt.numberwidth = 2
-- vim.opt.wrap = false
-- vim.opt.scrolloff = 8
-- vim.opt.inccommand = "nosplit"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true -- Enable persistent undo
-- vim.opt.completeopt = { "menuone", "popup", "noinsert" }
-- vim.opt.hlsearch = false
vim.cmd.filetype("plugin indent on")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
