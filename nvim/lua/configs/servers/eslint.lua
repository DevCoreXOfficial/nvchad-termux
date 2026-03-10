-- Configuración para ESLint LSP
-- Requiere: eslint-lsp o eslint_d instalado via Mason

local nvlsp = require "nvchad.configs.lspconfig"

return {
  cmd = { "eslint-lsp", "--stdio" },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    codeActionOnSave = {
      enable = true,
      mode = "all",
    },
    format = true,
    quiet = false,
    onIgnoredFiles = "off",
    rulesCustomizations = {},
    run = "onType",
    validate = "on",
  },
}
