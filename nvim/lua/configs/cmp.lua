local cmp = require "cmp"

cmp.setup {
  -- Fuentes de autocompletado
  sources = {
    { name = "nvim_lsp" }, -- LSP
    { name = "buffer" }, -- Código del buffer actual
    { name = "path" }, -- Rutas de archivos
    { name = "luasnip" }, -- Snippets (si usas LuaSnip)
  },

  -- Configuración de mapeos (atajos de teclado)
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Desplazar hacia arriba en la documentación
    ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Desplazar hacia abajo en la documentación
    ["<C-Space>"] = cmp.mapping.complete(), -- Activar el autocompletado manualmente
    ["<CR>"] = cmp.mapping.confirm { select = true }, -- Confirmar selección (Enter)

    -- Teclas para navegar por las opciones de autocompletado
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() -- Seleccionar la siguiente opción
      else
        fallback() -- Si no hay opciones, hacer lo que la tecla Tab haría normalmente
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() -- Seleccionar la opción anterior
      else
        fallback() -- Si no hay opciones, hacer lo que la tecla Shift + Tab haría normalmente
      end
    end, { "i", "s" }),

    -- Navegación con flechas
    ["<Down>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item() -- Seleccionar la siguiente opción con la flecha hacia abajo
      else
        fallback() -- Si no hay opciones, hacer lo que la flecha hacia abajo haría normalmente
      end
    end, { "i", "s" }),

    ["<Up>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item() -- Seleccionar la opción anterior con la flecha hacia arriba
      else
        fallback() -- Si no hay opciones, hacer lo que la flecha hacia arriba haría normalmente
      end
    end, { "i", "s" }),
  },

  -- Configuración de ventanas (autocompletado y documentación)
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered(),
  },

  -- Otras configuraciones experimentales
  experimental = {
    ghost_text = true, -- Mostrar texto fantasma de las sugerencias mientras escribes
  },
}
