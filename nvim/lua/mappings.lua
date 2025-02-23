require "nvchad.mappings" -- Asegúrate de mantener la configuración de mapeos predeterminada

-- Crear el objeto de mapeo para hacer más sencilla la adición de teclas
local map = vim.keymap.set

-- Mapeo para ejecutar Prettier en el archivo actual
map("n", "<leader>fn", ":!prettier --write %<CR>", { desc = "Format with Prettier" })

-- Otros mapeos que ya tenías
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
