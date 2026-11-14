vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Asegura que la carpeta site (parsers de Treesitter) esté en runtimepath
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

-- Verifica si tu archivo se llama keymap.lua o keymaps.lua
require("config.keymap")
require("config.settings")
require("config.lazy")
