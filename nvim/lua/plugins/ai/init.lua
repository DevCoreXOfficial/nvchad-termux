-- Plugins de IA y asistencia de código
-- GitHub Copilot, NeoAI, Neural, etc.

return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
    end,
  },

  -- NeoAI - Integración con OpenAI
  {
    "Bryley/neoai.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    opts = {},
  },

  -- Neural - Otra integración con OpenAI
  {
    "dense-analysis/neural",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    config = function()
      require("neural").setup {
        openai = {
          api_key = vim.env.OPENAI_API_KEY,
          max_tokens = 1000,
          temperature = 0.7,
        },
        ui = {
          icon = "🤖",
          keymaps = {
            close = "<Esc>",
            submit = "<Enter>",
          },
        },
      }
    end,
  },
}
