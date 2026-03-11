-- Resaltado de sintaxis con Treesitter
-- Instalación automática de parsers para desarrollo web con TypeScript

return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPre",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      -- Lenguajes web básicos
      "html",
      "css",
      "scss",
      "javascript",
      "typescript",
      "tsx",
      "jsx",

      -- Backend y scripting
      "bash",
      "sh",

      -- Datos y documentación
      "json",
      "markdown",
      "markdown_inline",
      "yaml",
      "toml",

      -- Lenguajes recomendados para desarrollador web
      "lua",
      "vim",
      "vimdoc",
      "sql",
      "dockerfile",
      "gitignore",
      "regex",
      "query",
    },

    -- Configuración de resaltado
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    -- Indentación basada en treesitter
    indent = {
      enable = true,
    },

    -- Incremental selection
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
