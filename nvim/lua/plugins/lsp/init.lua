-- Plugins de LSP, análisis de código y herramientas de lenguaje
return {
  -- LSP principal - neovim nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Gestor de servidores LSP y herramientas
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
        "prettier",
        "tailwindcss-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "eslint_d",
        "bash-language-server",
      },
    },
  },

  -- Mason LSP Config - integra mason con lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },

  -- Diagnóstico y UI de LSP
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Autotag - cierre automático y rename de etiquetas HTML/JSX/TSX
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end,
  },

  -- Navegación de símbolos
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    opts = {},
  },

  -- Plegado de código con nvim-ufo
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "VeryLazy",
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
