-- settings
require("options")
require("keymaps")
require("ui")

-- plugins
require("plugins.blinkcmp")
require("plugins.cord")
require("plugins.gitsigns")
require("plugins.conform")
require("plugins.neorg")
require("plugins.neotree")
require("plugins.treesitter")

-- early_initialization
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Toggleable floating terminal
local float_term = nil

function _G.toggle_floating_terminal()
	if float_term and vim.api.nvim_win_is_valid(float_term) then
		vim.api.nvim_win_close(float_term, true)
		float_term = nil
	else
		local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
		local width = math.floor(vim.o.columns * 0.8)
		local height = math.floor(vim.o.lines * 0.8)
		local row = math.floor((vim.o.lines - height) / 2)
		local col = math.floor((vim.o.columns - width) / 2)

		float_term = vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
		})

		vim.api.nvim_command("term") -- Open terminal in the buffer
		vim.cmd("startinsert") -- Start in insert mode
	end
end

vim.keymap.set("n", "<leader>t", toggle_floating_terminal, { noremap = true, silent = true })
