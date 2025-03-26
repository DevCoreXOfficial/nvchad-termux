require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Prettier Formatter
map("n", "<leader>fn", ":%!prettier --stdin-filepath %<CR>", { desc = "Format with Prettier" })

-- NeoAi Toggle Window
vim.api.nvim_set_keymap("n", "<Space>ai", ":NeoAIToggle<CR>", { noremap = true, silent = true })

-- NeoAI Context Window
vim.api.nvim_set_keymap("n", "<Space>ac", ":NeoAIContextOpen<CR>", { noremap = true, silent = true })
