-- Mapeos personalizados de teclas
require "nvchad.mappings"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================
-- Mapeos globales
-- ============================================

-- Modo comando
map("n", ";", ":", { desc = "Entrar en modo comando" })
map("i", "jk", "<ESC>", { desc = "Salir de modo inserción" })

-- Mover líneas
map("n", "<A-j>", "<Esc>:m .+1<CR>==", { desc = "Mover línea abajo" })
map("n", "<A-k>", "<Esc>:m .-2<CR>==", { desc = "Mover línea arriba" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==", { desc = "Mover línea abajo" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==", { desc = "Mover línea arriba" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Mover selección abajo" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Mover selección arriba" })

-- Splits
map("n", "<S-h>", "<C-w>h", { desc = "Ir al split izquierdo" })
map("n", "<S-l>", "<C-w>l", { desc = "Ir al split derecho" })
map("n", "<S-j>", "<C-w>j", { desc = "Ir al split inferior" })
map("n", "<S-k>", "<C-w>k", { desc = "Ir al split superior" })

-- ============================================
-- Formateo global
-- ============================================
map("n", "<leader>fm", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Formatear código" })

-- ============================================
-- IA y asistentes
-- ============================================
map("n", "<leader>aa", ":CodeCompanionChat<CR>", { desc = "CodeCompanion: Abrir chat" })
map("v", "<leader>aa", ":CodeCompanionChat<CR>", { desc = "CodeCompanion: Chat con selección" })
map("v", "<leader>ai", ":CodeCompanion<CR>", { desc = "CodeCompanion: Transformar selección" })
map("n", "<leader>ai", ":CodeCompanion<CR>", { desc = "CodeCompanion: Crear código inline" })
map("n", "<leader>at", ":CodeCompanionChat -t<CR>", { desc = "CodeCompanion: Toggle chat" })
map("n", "<leader>am", ":CodeCompanionActions<CR>", { desc = "CodeCompanion: Menú de acciones" })
map("n", "<leader>as", ":CodeCompanionChat -s<CR>", { desc = "CodeCompanion: Cambiar adapter" })

-- Copilot
map("i", "<C-l>", function()
  local suggestion = vim.fn["copilot#Accept"]("")
  if suggestion ~= "" then
    vim.api.nvim_feedkeys(suggestion, "n", true)
  end
end, { silent = true, desc = "Copilot: Aceptar sugerencia" })
map("i", "<C-j>", "copilot#Next()", { expr = true, silent = true, desc = "Copilot: Siguiente" })
map("i", "<C-k>", "copilot#Previous()", { expr = true, silent = true, desc = "Copilot: Anterior" })
map("i", "<C-h>", "copilot#Dismiss()", { expr = true, silent = true, desc = "Copilot: Descartar" })

-- ============================================
-- Navegación y búsqueda
-- ============================================
map("n", "<S-l>", ":bnext<CR>", { desc = "Siguiente buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Buffer anterior" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Buscar archivos" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Buscar texto" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buscar buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Buscar ayuda" })

-- ============================================
-- Splits y ventanas
-- ============================================
map("n", "<leader>sv", "<C-w>v", { desc = "Dividir verticalmente" })
map("n", "<leader>sh", "<C-w>s", { desc = "Dividir horizontalmente" })
map("n", "<leader>sq", ":close<CR>", { desc = "Cerrar split" })
map("n", "<leader>so", ":only<CR>", { desc = "Cerrar otros splits" })

-- ============================================
-- Diagnósticos LSP
-- ============================================
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Lista de diagnósticos" })

-- ============================================
-- Portapapeles
-- ============================================
map("n", "<leader>y", ":%yank<CR>", { desc = "Copiar todo al portapapeles" })

-- ============================================
-- Utilidades
-- ============================================
map("n", "<leader>sr", ":source $MYVIMRC<CR>", { desc = "Recargar configuración" })
map("n", "<leader>ch", ":nohlsearch<CR>", { desc = "Limpiar resaltado" })
map("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggle wrap" })
map("n", "<leader>tn", ":set relativenumber!<CR>", { desc = "Toggle números relativos" })

-- ============================================
-- Plegado de código (nvim-ufo)
-- ============================================
map("n", "<leader>z", "za", { desc = "Toggle fold" })
map("n", "<leader>zR", "zR", { desc = "Abrir todos los folds" })
map("n", "<leader>zM", "zM", { desc = "Cerrar todos los folds" })

-- ============================================
-- Mapeos por tipo de archivo (buffer-local)
-- ============================================
local ft_augroup = vim.api.nvim_create_augroup("ft_specific_mappings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = ft_augroup,
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype
    local bopts = { buffer = buf, noremap = true, silent = true }

    -- Bash / Sh / Zsh
    if ft == "bash" or ft == "sh" or ft == "zsh" then
      map("n", "<leader>fs", ":%!shfmt<CR>", vim.tbl_extend("force", bopts, { desc = "Formatear con shfmt" }))
    end

    -- SQL
    if ft == "sql" then
      map("n", "<leader>fq", ":w<CR>:%!psqlformat --spaces=2 %<CR>", vim.tbl_extend("force", bopts, { desc = "Formatear SQL" }))
    end
  end,
})
