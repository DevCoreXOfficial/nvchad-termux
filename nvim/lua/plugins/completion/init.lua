-- Plugins de autocompletado y snippets
-- Configuración de nvim-cmp, fuentes de completado y motores de snippets

return {
  -- nvim-cmp - Motor principal de autocompletado
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- Completados del buffer
      "hrsh7th/cmp-nvim-lsp", -- Completados LSP
      "hrsh7th/cmp-path", -- Completados de rutas
      "saadparwaiz1/cmp_luasnip", -- Completados de snippets
      "hrsh7th/cmp-cmdline", -- Completados para línea de comandos
    },
    config = function()
      require "configs.cmp"
    end,
  },

  -- LuaSnip - Motor de snippets
  -- La configuración de snippets se carga en init.lua
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Snippets predefinidos
    },
  },

  -- Luasnip extra snippets
  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },
}
