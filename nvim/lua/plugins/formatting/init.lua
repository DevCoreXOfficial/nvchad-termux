-- Plugins de formateo de código
-- Configuración de conform.nvim y formatters

return {
  -- Conform.nvim - Formateador ligero y rápido
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
}
