local opt = vim.opt

-- Números de línea y columnas
opt.signcolumn = "yes"
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.colorcolumn = "80"

-- Comportamiento de interfaz y desplazamiento
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.wrap = false
opt.title = true
opt.termguicolors = true

-- Ratón y portapapeles del sistema
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Indentación (2 espacios)
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Búsqueda inteligente (ignora mayúsculas salvo que escribas una)
opt.ignorecase = true
opt.smartcase = true

-- Ventanas divididas (splits) más naturales
opt.splitright = true
opt.splitbelow = true

-- Historial persistente y tiempos de respuesta rápidos
opt.undofile = true
opt.updatetime = 250
