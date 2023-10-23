return {
  {
    "jay-babu/mason-null-ls.nvim",
    tag = "v2.1.0",
    dependencies = {
      { "jose-elias-alvarez/null-ls.nvim", commit = "db09b6c691def0038c456551e4e2772186449f35", },
    },
    opts = {
      ensure_installed = {
        "shellcheck",
        "stylua",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    tag = "v2.1.1",
    opts = {
      ensure_installed = {
        "bash",
        "python",
      },
    },
  },
}
