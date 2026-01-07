-- Lazy nvim ( https://github.com/folke/lazy.nvim )
require("config.lazy")
require("config.keymaps")
require("config.autocmds")

-- Better tabulation handling
vim.opt.tabstop		= 4
vim.opt.shiftwidth 	= 4

-- Hybrid line number mode
vim.wo.relativenumber = true
vim.opt.number = true

-- Enable break indent
vim.o.breakindent = true

function overrideLineNumberColors()
	vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='white', bold=false })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='white', bold=false })
end

overrideLineNumberColors()
