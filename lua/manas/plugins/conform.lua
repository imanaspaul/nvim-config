return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "Conform", "ConformInfo" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { { "prettier" } },
        typescript = { { "prettier" } },
        javascriptreact = { { "prettier" } },
        typescriptreact = { { "prettier" } },
        go = { { "gofmt", "goimports" } },
        c = { { "clang-format" } },
        cpp = { { "clang-format" } },
        json = { { "prettier" } },
        css = { { "prettier" } },
        scss = { { "prettier" } },
        html = { { "prettier" } },
      },
      -- Enable automatic formatting on save
      -- format_on_save = {
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
    })
  end,
}
