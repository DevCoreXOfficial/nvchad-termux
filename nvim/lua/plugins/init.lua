return {
  -- LSP and related plugins
  {
    "neovim/nvim-lspconfig", -- LSP configuration
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim", -- LSP server manager
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

  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
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
    },
  },

  -- Plugin for automatic HTML/JSX tag completion
  {
    "windwp/nvim-ts-autotag", -- Automatically close and rename HTML/JSX tags
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Autocompletion and snippets plugins
  {
    "hrsh7th/nvim-cmp", -- Main autocompletion plugin
    event = "InsertEnter", -- Load when entering Insert mode
    config = function()
      require "configs.cmp" -- Load nvim-cmp configuration
    end,
    requires = {
      "hrsh7th/cmp-buffer", -- Buffer completions
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "hrsh7th/cmp-path", -- Path completions
      "saadparwaiz1/cmp_luasnip", -- LuaSnip completions
    },
  },

  -- NeoAI - OpenAI
  -- NOTE: set the OPENAI_API_KEY environment variable
  {
    "Bryley/neoai.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    config = function()
      require("neoai").setup()
    end,
  },

  -- Conform plugin (formatting)
  {
    "stevearc/conform.nvim", -- Formatter for Neovim
    opts = require "configs.conform",
  },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
    end,
  },
}
