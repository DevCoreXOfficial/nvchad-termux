return {
  -- Plugins existentes
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
        "prettier",
        "tailwindcss-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "eslint_d",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "bash",
        "json",
        "tsx",
        "gitignore",
      },
    },
  },

  -- Agregar nvim-cmp y sus dependencias
  {
    "hrsh7th/nvim-cmp", -- El plugin principal
    event = "InsertEnter", -- Se carga cuando entras en modo Insert
    config = function()
      require "configs.cmp" -- Cargar la configuración de nvim-cmp
    end,
    requires = {
      "hrsh7th/cmp-buffer", -- Fuente para el buffer actual (historial de código)
      "hrsh7th/cmp-nvim-lsp", -- Fuente para LSP (autocompletado inteligente)
      "hrsh7th/cmp-path", -- Fuente para autocompletado de rutas
      "saadparwaiz1/cmp_luasnip", -- Si usas snippets con LuaSnip
    },
  },
}
