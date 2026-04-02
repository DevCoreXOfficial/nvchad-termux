-- Mapeos personalizados de teclas
-- Extiende los mapeos por defecto de NvChad

require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================
-- Mapeos generales
-- ============================================

-- Modo comando
map("n", ";", ":", { desc = "Entrar en modo comando" })

-- Escape rápido en modo inserción
map("i", "jk", "<ESC>", { desc = "Salir de modo inserción" })

-- Mover líneas en modo normal
map("n", "<A-j>", "<Esc>:m .+1<CR>==", { desc = "Mover línea abajo" })
map("n", "<A-k>", "<Esc>:m .-2<CR>==", { desc = "Mover línea arriba" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==", { desc = "Mover línea abajo" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==", { desc = "Mover línea arriba" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover selección abajo" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover selección arriba" })

-- Moverse entre buffers
map("n", "<S-h>", "<C-w>h", { desc = "Ir al split izquierdo" })
map("n", "<S-l>", "<C-w>l", { desc = "Ir al split derecho" })
map("n", "<S-j>", "<C-w>j", { desc = "Ir al split inferior" })
map("n", "<S-k>", "<C-w>k", { desc = "Ir al split superior" })

-- ============================================
-- Formateo y herramientas
-- ============================================

-- Formatear con Prettier (conform.nvim)
map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatear con Prettier" })

-- Formatear script Bash con shfmt
map("n", "<leader>fs", ":%!shfmt<CR>", { desc = "Formatear Bash con shfmt" })

-- Formatear SQL con psqlformat
map("n", "<leader>fq", ":%!psqlformat --spaces=2 %<CR>", { desc = "Formatear SQL" })

-- ============================================
-- IA y asistentes
-- ============================================

-- CodeCompanion

-- Abrir chat de CodeCompanion
map("n", "<leader>aa", ":CodeCompanionChat<CR>", { desc = "CodeCompanion: Abrir chat" })

-- Chat con selección (modo visual) - Agrega el código seleccionado como contexto
map("v", "<leader>aa", ":CodeCompanionChat<CR>", { desc = "CodeCompanion: Chat con selección" })

-- Inline: Transformar código seleccionado (modo visual)
map("v", "<leader>ai", ":CodeCompanion<CR>", { desc = "CodeCompanion: Transformar selección" })

-- Inline: Crear código nuevo (modo normal)
map("n", "<leader>ai", ":CodeCompanion<CR>", { desc = "CodeCompanion: Crear código inline" })

-- Toggle chat (mostrar/ocultar)
map("n", "<leader>at", ":CodeCompanionChat -t<CR>", { desc = "CodeCompanion: Toggle chat" })

-- Abrir menú de acciones (slas commands, agentes, etc.)
map("n", "<leader>am", ":CodeCompanionActions<CR>", { desc = "CodeCompanion: Menú de acciones" })

-- Cambiar adapter (proveedor de IA)
map("n", "<leader>as", ":CodeCompanionChat -s<CR>", { desc = "CodeCompanion: Cambiar adapter" })

-- ============================================
-- GitHub Copilot
-- ============================================

-- Aceptar sugerencia
map("i", "<C-l>", function()
  local suggestion = vim.fn["copilot#Accept"]("")
  if suggestion ~= "" then
    vim.api.nvim_feedkeys(suggestion, "n", true)
  end
end, { silent = true, desc = "Copilot: Aceptar sugerencia" })

-- Siguiente sugerencia
map("i", "<C-j>", "copilot#Next()", { expr = true, silent = true, desc = "Copilot: Siguiente" })

-- Sugerencia anterior
map("i", "<C-k>", "copilot#Previous()", { expr = true, silent = true, desc = "Copilot: Anterior" })

-- Descartar sugerencia
map("i", "<C-h>", "copilot#Dismiss()", { expr = true, silent = true, desc = "Copilot: Descartar" })

-- ============================================
-- Navegación y búsqueda
-- ============================================

-- Navegar entre buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Siguiente buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Buffer anterior" })

-- Buscar archivos con Telescope (si está disponible)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Buscar archivos" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Buscar texto" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buscar buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Buscar ayuda" })

-- ============================================
-- Ventanas y splits
-- ============================================

-- Crear splits
map("n", "<leader>sv", "<C-w>v", { desc = "Dividir verticalmente" })
map("n", "<leader>sh", "<C-w>s", { desc = "Dividir horizontalmente" })

-- Cerrar splits
map("n", "<leader>sq", ":close<CR>", { desc = "Cerrar split" })
map("n", "<leader>so", ":only<CR>", { desc = "Cerrar otros splits" })

-- ============================================
-- Diagnósticos y LSP
-- ============================================

-- Navegar entre diagnósticos
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })

-- Mostrar diagnósticos en floating window
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico" })

-- Mostrar línea de diagnósticos
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Lista de diagnósticos" })

-- ============================================
-- Portapapeles
-- ============================================

-- Copiar todo el archivo al portapapeles
map("n", "<leader>y", ":%yank<CR>", { desc = "Copiar todo al portapapeles" })

-- ============================================
-- Utilidades
-- ============================================

-- Recargar configuración
map("n", "<leader>sr", ":source $MYVIMRC<CR>", { desc = "Recargar configuración" })

-- Limpiar resaltado de búsqueda
map("n", "<leader>ch", ":nohlsearch<CR>", { desc = "Limpiar resaltado" })

-- Toggle wrap
map("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle wrap" })

-- Toggle números relativos
map("n", "<leader>tn", ":set relativenumber!<CR>", { desc = "Toggle números relativos" })
