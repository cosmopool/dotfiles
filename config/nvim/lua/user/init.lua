return {
  lsp = {
    servers = {
      "dartls",
      "pyright",
      "lua_ls",
      "omnisharp_mono",
      "bashls",
    },
    -- formatting = {
    --   filter = function(client)
    --     -- only enable null-ls for dart files
    --     if vim.bo.filetype == "dart" then
    --       return client.name == "null-ls"
    --     end
    --   end
    -- },
    setup_handlers = {
      -- add custom handler
      dartls = function(_, opts) require("flutter-tools").setup { lsp = opts } end,
    },
    config = {
      dartls = {
        color = {
          enabled = true,
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
      vls = function()
        return {
          cmd = { "au", "BufNewFile", "BufRead", "*.v", "set", "filetype=vlang" },
          filetypes = { "v" },
          root_dir = require("lspconfig.util").root_pattern("pack.pl"),
        }
      end,
    },
  },
}
