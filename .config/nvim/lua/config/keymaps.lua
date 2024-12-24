--[[ MAPPINGS.LUA ]]
--

-- Helper Functions

local setKeys = function(keys, cmd, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, cmd, { desc = desc })
end

-- Mappings - builtin

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

setKeys("<Up>", "<Nop>", "Disable Up")
setKeys("<Down>", "<Nop>", "Disable Down")
setKeys("<Left>", "<Nop>", "Disable Left")
setKeys("<Right>", "<Nop>", "Disable Right")
