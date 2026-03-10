-- Configuración para Tailwind CSS Language Server
-- Requiere: tailwindcss-language-server instalado via Mason

local nvlsp = require "nvchad.configs.lspconfig"

return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    userLanguages = {
      javascript = "javascriptreact",
      typescript = "typescriptreact",
    },
  },
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = "warning",
        invalidApply = "warning",
        invalidScreen = "warning",
        invalidVariant = "warning",
        invalidConfigPath = "warning",
        invalidTailwindDirective = "warning",
        recommendedVariantOrder = "warning",
      },
      classAttributes = {
        "class",
        "className",
        "class:list",
        "classList",
        "ngClass",
      },
      includeLanguages = {
        html = "html",
        css = "css",
        javascript = "javascript",
        typescript = "typescript",
        javascriptreact = "javascriptreact",
        typescriptreact = "typescriptreact",
      },
    },
  },
}
