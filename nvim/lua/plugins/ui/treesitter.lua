-- Resaltado de sintaxis con Treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = "BufReadPre",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    -- Auto instala parsers al abrir archivos
    require("nvim-treesitter.install").setup_auto_install()

    -- Highlight e indent
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local ok = pcall(vim.treesitter.start, ev.buf)
        if ok then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
