-- Plugins de IA y asistencia de código
-- GitHub Copilot y CodeCompanion

return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    commit = "0668308e68b0ac28b332b204b469fbe04601536a",
    lazy = false,
    config = function()
      vim.g.copilot_no_tab_map = true
    end,
  },

  -- CodeCompanion - Asistente de IA multiproveedor
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim", -- opcional, para mejor UI
    },
    event = "VeryLazy",
    config = function()
      require("codecompanion").setup {
        adapters = {
          -- OpenAI
          openai = function()
            return require("codecompanion.adapters").extend("openai", {
              env = {
                api_key = "OPENAI_API_KEY",
              },
              schema = {
                model = {
                  default = "gpt-4o",
                },
              },
            })
          end,
          -- Mistral AI
          mistral = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              name = "Mistral",
              env = {
                api_key = "MISTRAL_API_KEY",
              },
              schema = {
                model = {
                  default = "mistral-large-latest",
                },
                api_base = {
                  default = "https://api.mistral.ai/v1",
                },
              },
            })
          end,
          -- Anthropic (Claude)
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "ANTHROPIC_API_KEY",
              },
              schema = {
                model = {
                  default = "claude-sonnet-4-20250514",
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "mistral", -- adapter por defecto (Mistral funciona mejor en Termux)
          },
          inline = {
            adapter = "mistral",
          },
        },
        opts = {
          display = {
            chat = {
              show_settings = true,
            },
          },
        },
      }
    end,
  },
}
