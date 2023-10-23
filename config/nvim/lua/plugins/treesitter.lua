return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.0",
  lazy = false,
  priority = 1000,
  opts = {
    ensure_installed = { "lua", "dart", "go", "json", "yaml", "v", "python", "swift", "c", "rust", "markdown_inline",
      "markdown", },
  },
}
