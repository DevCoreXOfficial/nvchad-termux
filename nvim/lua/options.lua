-- Opciones personalizadas de Neovim
-- Extiende las opciones por defecto de NvChad

require "nvchad.options"

local o = vim.opt
local g = vim.g

-- ============================================
-- Opciones generales
-- ============================================

-- Línea de cursor
o.cursorlineopt = "both" -- Muestra cursorline en número de línea y texto

-- Números de línea
o.relativenumber = true -- Números de línea relativos
o.number = true -- Muestra número de línea absoluto

-- Búsqueda
o.ignorecase = true -- Ignorar mayúsculas en búsquedas
o.smartcase = true -- Usar mayúsculas si hay mayúsculas en el patrón
o.hlsearch = true -- Resaltar resultados de búsqueda

-- Tabulación y sangría
o.tabstop = 2 -- Número de espacios que representa un tab
o.shiftwidth = 2 -- Número de espacios para autoindent
o.expandtab = true -- Expandir tabs a espacios
o.autoindent = true -- Copiar sangría de la línea anterior
o.smartindent = true -- Sangría inteligente

-- Líneas y columnas
o.wrap = false -- No ajustar líneas
o.scrolloff = 8 -- Líneas de margen al hacer scroll
o.sidescrolloff = 8 -- Columnas de margen al hacer scroll lateral

-- Split windows
o.splitright = true -- Abrir splits verticales a la derecha
o.splitbelow = true -- Abrir splits horizontales abajo

-- Portapapeles
o.clipboard = "unnamedplus" -- Usar el portapapeles del sistema

-- Persistencia de undo
o.undofile = true -- Guardar undo en archivo
o.undolevels = 10000 -- Máximo nivel de undo

-- Tiempo de espera para mapeos y teclas
o.timeoutlen = 300 -- Tiempo para mapeos (ms)
o.updatetime = 200 -- Tiempo para trigger de eventos (ms)

-- Colores y apariencia
o.termguicolors = true -- Soporte para colores true color
o.signcolumn = "yes" -- Siempre mostrar columna de signos

-- Backspace
o.backspace = "indent,eol,start" -- Comportamiento del backspace

-- ============================================
-- Variables globales personalizadas
-- ============================================

-- Leader key (ya definido en init.lua)
-- g.mapleader = " "

-- ============================================
-- Autocomandos personalizados
-- ============================================

-- Resaltar búsqueda al escribir
vim.api.nvim_create_autocmd("CmdlineEnter", {
  pattern = "/",
  callback = function()
    vim.opt.hlsearch = true
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  pattern = "/",
  callback = function()
    vim.opt.hlsearch = false
  end,
})

-- Eliminar línea en blanco al final del archivo al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Opcional: eliminar whitespace al final de las líneas
    -- vim.cmd([[%s/\s\+$//e]])
  end,
})
