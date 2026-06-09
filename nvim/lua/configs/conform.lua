local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    yaml = { "prettier" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
    sql = { "pg_format" },
    python = { "black" },
    go = { "gofmt", "goimports" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    php = { "php_cs_fixer" },
    rust = { "rustfmt" },
    kotlin = { "ktfmt" },
  },

  formatters = {
    ktfmt = {
      command = "ktfmt",
    },
  },
}

return options
