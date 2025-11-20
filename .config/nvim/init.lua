-- [[ General ]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Imports ]]
require("config.lazy")
require("config.options")
require("config.lsp")
-- require("config.autocomplete")

vim.cmd("colorscheme kanagawa")
