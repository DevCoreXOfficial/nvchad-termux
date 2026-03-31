-- Resaltado de sintaxis con Treesitter
-- Instalación automática de parsers para desarrollo web con TypeScript

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = "BufReadPre",
  build = ":TSUpdate",
  config = function()
    -- Setup solo acepta install_dir, nada más
    require("nvim-treesitter").setup()

    -- Instalar parsers
    local parsers = {
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "bash",
      "json",
      "markdown",
      "markdown_inline",
      "yaml",
      "toml",
      "lua",
      "vim",
      "vimdoc",
      "sql",
      "dockerfile",
      "gitignore",
      "regex",
      "query",
    }
    require("nvim-treesitter.install").install(parsers)

    -- Highlight e indent via autocmd (nueva forma)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        -- Activa treesitter highlight
        local ok = pcall(vim.treesitter.start, ev.buf)

        -- Activa indent
        if ok then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    -- incremental selection
    vim.keymap.set("n", "<C-space>", function()
      require("nvim-treesitter.incremental_selection").init_selection()
    end, { silent = true })
  end,
}
