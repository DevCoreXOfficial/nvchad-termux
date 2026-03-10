-- Plugins de interfaz de usuario
-- Temas, barras de estado, buffers, etc.

return {
  -- Barra de estado
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
    },
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
      },
    },
  },

  -- Notificaciones
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      timeout = 3000,
      top_down = false,
    },
  },

  -- Iconos
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- Which key - Muestra atajos de teclado
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    opts = {},
  },
}
