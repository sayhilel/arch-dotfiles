vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Syncs clipboard with OS
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.undofile = true
vim.opt.fillchars = { eob = " " }

-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
