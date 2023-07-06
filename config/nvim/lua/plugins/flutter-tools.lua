return {
  "akinsho/flutter-tools.nvim",
  event = "BufRead *.dart",
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup {
      debugger = {
        enabled = true,
        run_via_dap = true,
      },
      dev_log = { enabled = true, open_cmd = "tabedit" },
      lsp = {
        color = {
          enabled = true,
          background = true,
          virtual_text = true,
          virtual_text_str = "■",
        },
        settings = {
          showTodos = true,
          renameFilesWithClasses = "prompt",
        },
      },
    }
  end,
}
