-- Archivo principal de plugins
-- Este archivo importa todas las categorías de plugins desde sus respectivos módulos

return {
  -- Importar plugins de LSP
  { import = "plugins.lsp" },

  -- Importar plugins de autocompletado
  { import = "plugins.completion" },

  -- Importar plugins de formateo
  { import = "plugins.formatting" },

  -- Importar plugins de UI
  { import = "plugins.ui" },

  -- Importar plugins de IA
  { import = "plugins.ai" },
}
