require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Prettier Formatter
map("n", "<leader>fp", ":%!prettier --stdin-filepath %<CR>", { desc = "Format with Prettier" })

-- NeoAi Toggle Window
map("n", "<Space>ai", ":NeoAIToggle<CR>", { noremap = true, silent = true })

-- NeoAI Context Window
map("n", "<Space>ac", ":NeoAIContextOpen<CR>", { noremap = true, silent = true })

-- Neural Open Chat
map("n", "<leader>ne", ":Neural<CR>", { noremap = true, silent = true })

-- Bash Script Formatter
map("n", "<leader>fs", ":%!shfmt<CR>", { desc = "Format Bash script with shfmt", noremap = true, silent = true })

-- Postgresql Formatter
map("n", "<leader>fq", ":%!psqlformat --spaces=2 %<CR>", { desc = "Format with psqlformat" })
