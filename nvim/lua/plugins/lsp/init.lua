-- Plugins de LSP y relacionados
-- Configuración de servidores de lenguaje, diagnóstico y navegación de código

return {
  -- LSP principal
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Gestor de servidores LSP
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
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

  -- Mason LSP Config - integra mason con lspconfig
  -- Nota: Con la API moderna vim.lsp.config, no usamos mason-lspconfig para configurar
  -- Solo usamos mason.nvim para instalar los servidores
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },

  -- Treesitter - Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
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
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },

  -- Autotag - Cierre automático de etiquetas HTML/JSX
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end,
  },

  -- Diagnóstico y UI de LSP
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Navegación de símbolos
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    opts = {},
  },
}
